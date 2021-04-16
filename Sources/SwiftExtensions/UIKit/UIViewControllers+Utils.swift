//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension UIViewController {
    @objc class var storyBoardId : String { return String(describing: self).components(separatedBy: ".").last! }
    class func instanceFromNib() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
    class func instanceFromStoryboard(_ name : String = "Main") -> Self {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateViewController(withIdentifier: storyBoardId) as! Self
    }
    
    func showAlert(title: String, message: String, buttonTitle: String = "OK", action: ((UIAlertAction)->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: action))
        self.present(alert, animated: true, completion: nil)
    }
    func showAlert(title: String, message: String, buttons: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for btn in buttons { alert.addAction(btn) }
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

public extension UINavigationController {
    
    func popViewController(animated: Bool = true, completion: (() -> Void)?) {
        guard completion != nil else {
            popViewController(animated: animated)
            return
        }
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)?) {
        guard completion != nil else {
            pushViewController(viewController, animated: animated)
            return
        }
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func fadePushViewController(_ viewController : UIViewController, transitionTime : CFTimeInterval = 0.25) {
        let transition = CATransition()
        transition.duration = transitionTime
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.view.layer.add(transition, forKey: nil)
        self.pushViewController(viewController, animated: false)
    }
    func fadePopViewController(_ transitionTime : CFTimeInterval = 0.25) {
        let transition = CATransition()
        transition.duration = transitionTime
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.view.layer.add(transition, forKey: nil)
        self.popViewController(animated: false)
    }
    func fadePopToViewController(_ viewController : UIViewController, _ transitionTime : CFTimeInterval = 0.25) {
        let transition = CATransition()
        transition.duration = transitionTime
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.view.layer.add(transition, forKey: nil)
        self.popToViewController(viewController, animated: false)
    }
    func fadePopToRootViewController(_ transitionTime : CFTimeInterval = 0.25) {
        let transition = CATransition()
        transition.duration = transitionTime
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.view.layer.add(transition, forKey: nil)
        self.popToRootViewController(animated: false)
    }
}

public extension UIAlertController {
    func addCancel(title : String = "Cancel", handler : ((UIAlertAction)->Void)? = nil) {
        self.addAction(UIAlertAction(title: title, style: .cancel, handler: handler))
    }
    func addSubmit(title : String = "Submit", handler : ((UIAlertAction)->Void)? = nil) {
        self.addAction(UIAlertAction(title: title, style: .default, handler: handler))
    }
}
