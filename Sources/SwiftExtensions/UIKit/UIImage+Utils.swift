//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation
import UIKit

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    func crop(to size : CGSize) -> UIImage {
        let point = CGPoint(x: (self.size.width - size.width)/2, y: (self.size.height - size.height)/2)
        return crop(to: CGRect(origin: point, size: size))
    }
    func crop(to rect: CGRect) -> UIImage {
        var rect = rect
//        print(#function, "RECT:", rect, self.scale, rect.width / rect.height, CGFloat(16)/9)
        rect.origin.x*=self.scale
        rect.origin.y*=self.scale
        rect.size.width*=self.scale
        rect.size.height*=self.scale
        
        let imageRef = self.cgImage!.cropping(to: rect)
        let image = UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
        return image
    }
}
