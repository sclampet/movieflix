//
//  MoviesRowCell.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray
        setupViews()
        constrainViews()
    }

    func configure(forMovie: Movie) {}
    func setupViews() {}
    func constrainViews() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCell {
}
