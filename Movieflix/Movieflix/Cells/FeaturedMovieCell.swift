//
//  FeaturedMovieCell.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/29/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class FeaturedMovieCell: UICollectionViewCell {
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let posterTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myListView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let myListImageView: UIImageView = {
        let imageView = UIImageView(image: Images.plus.image)
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let myListLabel: UILabel = {
        let label = UILabel()
        label.text = "My List"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let playImageView: UIImageView = {
        let imageView = UIImageView(image: Images.play.image)
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playLabel: UILabel = {
        let label = UILabel()
        label.text = "Play"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoImageView: UIImageView = {
        let imageView = UIImageView(image: Images.info.image)
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupGradientLayers()
        constrainViews()
    }
    
    private func setupViews() {
        addSubviews(poster,
                    posterTitle,
                    myListView,
                    playView,
                    infoView)
        
        myListView.addSubviews(myListImageView, myListLabel)
        
        playView.addSubviews(playImageView, playLabel)
        
        infoView.addSubviews(infoImageView, infoLabel)
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            //Poster
            poster.topAnchor.constraint(equalTo: self.topAnchor),
            poster.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.frame.height * -0.15),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            poster.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            //Poster Title
            posterTitle.bottomAnchor.constraint(equalTo: poster.bottomAnchor, constant: -45),
            posterTitle.widthAnchor.constraint(equalToConstant: self.frame.width / 1.5),
            posterTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //My List
            myListView.topAnchor.constraint(equalTo: poster.bottomAnchor),
            myListView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myListView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myListView.widthAnchor.constraint(equalToConstant: frame.width / 3),
            
            myListImageView.topAnchor.constraint(equalTo: myListView.topAnchor),
            myListImageView.centerXAnchor.constraint(equalTo: myListView.centerXAnchor),
            
            myListLabel.topAnchor.constraint(equalTo: myListImageView.bottomAnchor),
            myListLabel.leadingAnchor.constraint(equalTo: myListView.leadingAnchor),
            myListLabel.trailingAnchor.constraint(equalTo: myListView.trailingAnchor),
            
            //Play
            playView.topAnchor.constraint(equalTo: poster.bottomAnchor),
            playView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            playView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05),
            playView.widthAnchor.constraint(equalToConstant: frame.width / 3),
            
            playImageView.leadingAnchor.constraint(equalTo: playView.leadingAnchor, constant: 35),
            playImageView.centerYAnchor.constraint(equalTo: playView.centerYAnchor),
            
            playLabel.leadingAnchor.constraint(equalTo: playImageView.trailingAnchor, constant: 10),
            playLabel.centerYAnchor.constraint(equalTo: playImageView.centerYAnchor),
            
            //Info
            infoView.topAnchor.constraint(equalTo: poster.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: playView.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            infoView.widthAnchor.constraint(equalToConstant: frame.width / 3),
            
            infoImageView.topAnchor.constraint(equalTo: infoView.topAnchor),
            infoImageView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: infoImageView.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeaturedMovieCell {
    func configure(forMovie movie: Movie) {
        posterTitle.text = movie.title.uppercased()
        
        if let posterPath = movie.posterPath,
            let url = URL(string: "http://image.tmdb.org/t/p/w185\(posterPath)") {
            poster.load(url: url)
        }
        else {
            poster.load(url: URLs.defaultFeature.url())
        }
    }
    
    private func setupGradientLayers() {
        guard poster.layer.sublayers == nil else { return }

        for number in 0..<3 {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]

            switch number {
            case 0:
                //bottom
                gradientLayer.locations = [0.5, 0.65]
            case 1:
                //right
                gradientLayer.startPoint = CGPoint(x: 0.75, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            case 2:
                //left
                gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 0.00005, y: 0.5)
            default:
                fatalError("attempting to add too many gradient layers")
            }
            
            poster.layer.addSublayer(gradientLayer)
        }
    }
}
