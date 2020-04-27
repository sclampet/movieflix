//
//  HomeView.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class HomeView: UIView {
    private var movies: [String: [Movie]] {
        didSet {
            collectionView.reloadData()
        }
    }
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let margin = CGFloat(12)
        let interimItemSpacing = CGFloat(3)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        let width = (UIScreen.main.bounds.width - (margin * 2))
        let height = width * 0.5
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = interimItemSpacing
        layout.minimumLineSpacing = 14
        
        return layout
    }()
    
    var collectionView: UICollectionView!
    
    init(movies: [String: [Movie]]) {
        self.movies = movies
        
        super.init(frame: .zero)

        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    private func setupViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MoviesRow.self, forCellWithReuseIdentifier: "moviesRow")
        
        self.addSubview(collectionView)
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
}

// MARK: CollectionView Delegate & Datasource
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category: String
        
        switch indexPath.row {
        case 0:
            category = "popular"
        case 1:
            category = "nowPlaying"
        case 2:
            category = "latest"
        case 3:
            category = "topRated"
        default:
            print("unable to render movies for row: \(indexPath.row). using popular movies")
            category = "popular"
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesRow", for: indexPath) as! MoviesRow

        if let moviesForRow = movies[category] {
            cell.configure(for: category, with: moviesForRow)
        }

        return cell
    }
}
