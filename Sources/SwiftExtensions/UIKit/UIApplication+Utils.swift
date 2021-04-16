//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation
import UIKit

public extension UIApplication {
    static var statusBarHeight: CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = shared.windows.filter { $0.isKeyWindow }.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    static var tabBarHeight : CGFloat {
        var height : CGFloat = 0
        if let vc = self.presentingVC() {
            height = vc.tabBarController?.tabBar.frame.height ?? 0
        }
        return height
    }
    
    static func presentingVC() -> UIViewController? {
        var _vc = UIApplication.shared.topMostViewController()
        if let tab = _vc as? UITabBarController { // ?? _vc?.tabBarController
            _vc = tab.selectedViewController //use selected vc
        }
        if let nav = _vc as? UINavigationController ?? _vc?.navigationController{
            return nav.topViewController
        }
        return _vc
    }
    
    func topMostViewController() -> UIViewController? {
        if var topController = self.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
}

public extension UIApplication {
    @available(iOS 13.0, *)
    var mainScene : UIWindowScene? {
        self.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first
    }
    var mainWindow : UIWindow? {
        if #available(iOS 13.0, *) {
            return self.mainScene?.windows
                .filter({$0.isKeyWindow}).first
        } else {
            // Fallback on earlier versions
            return self.keyWindow
        }
    }
}
