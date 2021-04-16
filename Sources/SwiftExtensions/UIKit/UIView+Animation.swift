//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

@available(iOS 10.0, *)
public extension UIView {
    func errorShaking(_ beforeShaking: (()->Void)? = nil, _ completion : (()->Void)? = nil) {
        let view = self
        let distance : CGFloat = 20
        beforeShaking?()
        let animator1 = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut) {
            view.transform = CGAffineTransform(translationX: -distance * 1, y: 0)
        }
        let animator2 = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut) {
            view.transform = CGAffineTransform(translationX: distance * 1, y: 0)
        }
        let animator3 = UIViewPropertyAnimator(duration: 0.05, curve: .easeInOut) {
            view.transform = CGAffineTransform(translationX: -distance * 0.5, y: 0)
        }
        let animator4 = UIViewPropertyAnimator(duration: 0.05, curve: .easeInOut) {
            view.transform = CGAffineTransform(translationX: distance * 0.5, y: 0)
        }
        let animator5 = UIViewPropertyAnimator(duration: 0.02, curve: .easeInOut) {
            view.transform = .identity
        }
        animator1.addCompletion { (_) in
            animator2.startAnimation()
        }
        animator2.addCompletion { (_) in
            animator3.startAnimation()
        }
        animator3.addCompletion { (_) in
            animator4.startAnimation()
        }
        animator4.addCompletion { (_) in
            animator5.startAnimation()
        }
        animator5.addCompletion { (_) in
            Timer.after(0.2, { (_) in
                if let _func = completion { _func() }
            })
        }
        animator1.startAnimation()
    }
    @discardableResult
    func addBlurEffect(_ style : UIBlurEffect.Style) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.sendSubviewToBack(blurEffectView)
        return blurEffectView
    }
    func setBorder(color: UIColor, width: CGFloat = 1, radius : CGFloat? = nil) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        if let r = radius { self.layer.cornerRadius = r }
    }
}
