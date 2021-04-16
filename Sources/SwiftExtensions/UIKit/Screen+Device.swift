//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension UIScreen {
    var isLandscape : Bool { return self.bounds.size.isLandscape }
}

private var _windowSafeArea : UIEdgeInsets = .zero
private let kStatusBarHeight : CGFloat = 20
@available(iOS 11.0, *)
public extension UIDevice {
    
    var isIphone : Bool {
        self.userInterfaceIdiom == .phone || self.model.lowercased().contains("iphone")
    }
    var isIphonePlus : Bool { return self.isIphone && self.model.lowercased().contains("plus")  }
    var hasNotch : Bool {
        return notchHeight > kStatusBarHeight
    }
    
    var windowSafeArea : UIEdgeInsets {
        if Thread.current.isMainThread {
            _windowSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
        }
        return _windowSafeArea
    }
    var notchHeight : CGFloat {
        let inset = windowSafeArea
        return max(inset.top, inset.left)
    }
    var bottomHeight : CGFloat {
        let inset = windowSafeArea
        return max(inset.bottom, inset.right)
    }
    var isIpad : Bool {
        self.userInterfaceIdiom == .pad || self.model.lowercased().contains("ipad")
    }
    var isIphoneLandscape : Bool { return self.isIphone && UIScreen.main.isLandscape }
    var isIpadLandscape : Bool { return self.isIpad && UIScreen.main.isLandscape }
    var isIphonePortrait : Bool { return self.isIphone && !UIScreen.main.isLandscape }
    var isIpadPortrait : Bool { return self.isIpad && !UIScreen.main.isLandscape }
    
    func loadSafeArea() {
        if Thread.current.isMainThread {
            _windowSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
        }
    }
}


public extension UIInterfaceOrientationMask {
    var isAllowedPortrait : Bool {
        switch self {
        case .all, .allButUpsideDown, .portrait, .portraitUpsideDown:
            return true
        default:
            return false
        }
    }
    var isAllowedLandscape : Bool {
        switch self {
        case .all, .allButUpsideDown, .landscape, .landscapeLeft, .landscapeRight:
            return true
        default:
            return false
        }
    }
}
