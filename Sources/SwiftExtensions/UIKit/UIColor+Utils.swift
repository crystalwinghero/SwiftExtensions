//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension UIColor {
    
    ///Init color with rgb value of 0 - 255
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    ///Init color with hex code (#000000 - #ffffff)
    convenience init(hexCode hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            self.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
    
    static func random() -> UIColor {
        return UIColor(red: Int(arc4random_uniform(255)), green: Int(arc4random_uniform(255)), blue: Int(arc4random_uniform(255)))
    }
}

