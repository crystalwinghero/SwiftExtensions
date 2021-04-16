//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension UILabel {
    
    func set(lineSpacing: CGFloat, lineHeightMultiple: CGFloat = 1, textAlignment: NSTextAlignment? = nil, lineBreakMode: NSLineBreakMode? = nil) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        if let alignment = textAlignment {
            paragraphStyle.alignment = alignment
        }
        paragraphStyle.lineBreakMode = lineBreakMode ?? NSLineBreakMode.byTruncatingTail
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
