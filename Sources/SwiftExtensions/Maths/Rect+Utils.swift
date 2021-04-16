//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension CGSize {
    
    var isLandscape : Bool { return self.width >= self.height }
    
    var maxValue : CGFloat { return max(width, height) }
    
    static var one : CGSize { return CGSize(width: 1, height: 1) }
    
    func scale(toWidth newWidth: CGFloat, _ keepRatio: Bool = false) -> CGSize {
        var width = self.width
        var height = self.height
        if keepRatio {
            height = height * (newWidth/width)
        }
        width = newWidth
        return CGSize(width: width, height: height)
    }
    func scale(toHeight newHeight: CGFloat, _ keepRatio: Bool = false) -> CGSize {
        var width = self.width
        var height = self.height
        if keepRatio {
            width = width * (newHeight/height)
        }
        height = newHeight
        return CGSize(width: width, height: height)
    }
    func scale(by factor : CGFloat) -> CGSize {
        return CGSize(width: width * factor, height: height * factor)
    }
    func scale(byX factorX : CGFloat, byY factorY : CGFloat) -> CGSize {
        return CGSize(width: width * factorX, height: height * factorY)
    }
    
    var rotated : CGSize {
        return CGSize(width: self.height, height: self.width)
    }
    var ratio : CGFloat { self.width / self.height }
    
    static func square(_ size : CGFloat) -> CGSize { return CGSize(width: size, height: size) }
    
    func asPortrait() -> CGSize {
        return self.isLandscape ? self.rotated : self
    }
    func asLandscape() -> CGSize {
        return !self.isLandscape ? self.rotated : self
    }
}

extension CGSize : Comparable {
    public static func < (l: CGSize, r: CGSize) -> Bool {
        return l.width < r.width && l.height < r.height
    }
    public static func == (l: CGSize, r: CGSize) -> Bool {
        return l.width == r.width && l.height == r.height
    }
}

public extension CGRect {
    static var one : CGRect { return CGRect(x: 0, y: 0, width: 1, height: 1) }
    func with(origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: self.size)
    }
    func with(size: CGSize) -> CGRect {
        return CGRect(origin: self.origin, size: size)
    }
    func withOffset(x: CGFloat, y: CGFloat, retainSize : Bool = false) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: retainSize ? size : CGSize(width: size.width - x, height: size.height - y))
    }
}
