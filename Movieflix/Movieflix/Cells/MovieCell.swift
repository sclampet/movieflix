//
//  MoviesRowCell.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    // MARK: Private
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray
        setupViews()
        constrainViews()
    }

    func setupViews() {
        addSubview(poster)
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: self.topAnchor),
            poster.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            poster.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func configure(forMovie movie: Movie) {
        if let posterURL = movie.posterPath,
            let url = URL(string: "http://image.tmdb.org/t/p/w185\(posterURL)") {
            poster.load(url: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
