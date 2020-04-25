//
//  MoviesRowCollectionViewCell.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class MoviesRowCollectionViewCell: UICollectionViewCell {
    // MARK: Exposed
    var movies: [Movie] = []
    
    // MARK: Private
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let margin = CGFloat(12)
        let interimItemSpacing = CGFloat(3)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        let width = (frame.width - (margin * 2) - interimItemSpacing) / 3.5
        let height = frame.height / 2
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = interimItemSpacing
        layout.minimumLineSpacing = 14
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    private var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PreviewMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "previewsCell")
        
        self.addSubview(collectionView)
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
}

// MARK: CollectionView Delegate & Datasource
extension MoviesRowCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let identifier: String
//
//        switch indexPath.row {
//        case 0:
//            identifier = "previewsCell"
//        case 1:
//            identifier = "previewsCell"
//        case 2:
//            identifier = "previewsCell"
//        case 3:
//            identifier = "previewsCell"
//        case 4:
//            identifier = "previewsCell"
//        default:
//            fatalError("unable to render collectionview cells in this row: \(indexPath.row)")
//        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewsCell", for: indexPath) as! PreviewMoviesCollectionViewCell
        cell.configure(forMovie: movies[indexPath.item])
        
        return cell
    }
}
