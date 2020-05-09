//
//  UIImage.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/29/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

enum Images: String {
    case info = "Info"
    case play = "Play"
    case plus = "Plus"
    case film = "Film"
    case playButton = "PlayButton"
    
    var image: UIImage {
        let image = UIImage(named: self.rawValue) ?? UIImage()
        return image
    }
}
