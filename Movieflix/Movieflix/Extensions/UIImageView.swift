//
//  UIImageView.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/27/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let myself = self else { return }
            
            if let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    myself.image = image
                }
            }
        }
    }
}
