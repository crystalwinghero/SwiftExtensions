//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension UIView {
    var automatedAccessibilityIdentifier : String { return "\(self)" }
    func useAutomatedAccessibilityIdentifier() {
        self.accessibilityIdentifier = self.automatedAccessibilityIdentifier
    }
    
    static var identifier : String { return "\(self)" }
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}

public extension UIEdgeInsets {
    init(vertical : CGFloat, horizontal : CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
}

public extension UIInterfaceOrientationMask {
    var title : String {
        switch self {
        case .all: return "all"
        case .allButUpsideDown: return "allButUpsideDown"
        case .landscape: return "landscape"
        case .landscapeLeft: return "landscapeLeft"
        case .landscapeRight: return "landscapeRight"
        case .portrait: return "portrait"
        case .portraitUpsideDown: return "portraitUpsideDown"
        default: return "\(self)"
        }
    }
}
