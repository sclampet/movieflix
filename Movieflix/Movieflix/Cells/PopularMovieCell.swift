//
//  PopularMovieCell.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/26/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class PopularMovieCell: MovieCell {
    // MARK: Private
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = (self.frame.size.width / 2)
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        
        setupViews()
        constrainViews()
    }
    
    override func setupViews() {
        addSubview(poster)
    }
    
    override func constrainViews() {
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: self.topAnchor),
            poster.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            poster.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    
    override func configure(forMovie movie: Movie) {
        if let posterURL = movie.posterPath,
            let url = URL(string: "http://image.tmdb.org/t/p/w185\(posterURL)") {
            poster.load(url: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
