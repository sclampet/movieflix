//
//  LoadingMovieCell.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/29/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class LoadingMovieCell: MovieCell {
    // MARK: Private
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        constrainViews()
    }

    override func setupViews() {
        addSubview(grayView)
    }
    
    override func constrainViews() {
        NSLayoutConstraint.activate([
            grayView.topAnchor.constraint(equalTo: self.topAnchor),
            grayView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            grayView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            grayView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientLayer = CAGradientLayer(layer: grayView.layer)
        gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.locations = [0, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = grayView.bounds
        
        grayView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func configure(forMovie movie: Movie) {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

