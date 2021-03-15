//
//  Extensions.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import Foundation
import UIKit

extension UIView {
    func makeRound() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height/2
        
    }
    
    func addBorderWithColor(color: UIColor) {
        self.layer.borderWidth = 8
        self.layer.borderColor = color.cgColor
    }
}
