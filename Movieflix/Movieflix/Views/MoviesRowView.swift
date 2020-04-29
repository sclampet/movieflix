//
//  MoviesRowViewView.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class MoviesRowView: UICollectionViewCell {
    // MARK: Exposed
    
    // MARK: Private
    private var movies: [Movie] = []
    private var identifier: String = "popular"
    private let movieCellId = "movieCell"
    private let popularCellId = "popularCell"
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let margin = CGFloat(6)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        let width = (frame.width - (margin * 2)) / 3.5
        let height = frame.height * 0.8
        layout.itemSize = CGSize(width: width, height: height) //initial dimensions are for regular movie posters
        layout.minimumLineSpacing = 14
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    private var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupCollectionView()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(title)
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "movieCell")
        collectionView.register(PopularMovieCell.self, forCellWithReuseIdentifier: popularCellId)
        
        self.addSubview(collectionView)
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            
            collectionView.topAnchor.constraint(equalTo: self.title.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: CollectionView Delegate & Datasource
extension MoviesRowView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count < 1 ? 6 : movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("collectionview has no layout") }
        
        let cellId = identifier == "popular" ? popularCellId : movieCellId
        let cellSize = identifier == "popular"
            ? CGSize(width: layout.itemSize.width, height: layout.itemSize.width)
            : layout.itemSize
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell
        cell.frame.size = cellSize
        
        if identifier != "loading" {
            cell.configure(forMovie: movies[indexPath.item])
        }
        
        return cell
    }
}

extension MoviesRowView {
    func configure(for identifier: String, with movies: [Movie]) {
        self.identifier = identifier
        self.movies = movies
        
        switch identifier {
        case "popular":
            self.title.text = "Popular"
        case "nowPlaying":
            self.title.text = "Now Playing"
        case "latest":
            self.title.text = "Latest"
        case "topRated":
            self.title.text = "Top Rated"
        case "loading":
            self.title.text = "..."
        default:
            print("invalid identifier: \(identifier)")
        }
    }
}
