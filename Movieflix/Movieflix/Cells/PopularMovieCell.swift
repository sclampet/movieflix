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
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let poster: UIImageView = {
        let poster = UIImageView()
        return poster
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        layer.cornerRadius = (self.frame.size.width / 2)
        layer.masksToBounds = true
        layer.borderColor = UIColor.cyan.cgColor
        layer.borderWidth = 2
        
        setupViews()
        constrainViews()
        
    }
    
    override func setupViews() {
        addSubview(title)
    }
    
    override func constrainViews() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    
    override func configure(forMovie movie: Movie) {
        title.text = movie.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
