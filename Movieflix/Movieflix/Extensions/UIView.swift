//
//  UIView.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/29/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

extension UIView {
    func addGrayBackgroundGradient() {
        let gradientLayer = CAGradientLayer(layer: self.layer)
        gradientLayer.colors = [Colors.gray.colors().cgColor, Colors.darkGray.colors().cgColor]
        gradientLayer.locations = [0, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
