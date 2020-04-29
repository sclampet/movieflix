//
//  HomeView.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class HomeView: UIView {
    // MARK: Private Properties
    private var movies: [String: [Movie]]
    private var collectionView: UICollectionView!
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let margin = CGFloat(12)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        let width = (UIScreen.main.bounds.width - (margin * 2))
        let height = width * 0.5
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 14
        
        return layout
    }()
    
    
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

// MARK: Private Methods
extension HomeView {
    private func setupViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MoviesRowView.self, forCellWithReuseIdentifier: "moviesRow")
        
        self.addSubview(collectionView)
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
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
            category = "popular"
            print("unable to render movies for row: \(indexPath.row). using popular movies as default category")
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesRow", for: indexPath) as! MoviesRowView
        
        if let moviesForRow = movies[category], moviesForRow.count > 0 {
            cell.configure(for: category, with: moviesForRow)
        }
        else {
            cell.configure(for: "loading", with: [])
        }

        return cell
    }
}
