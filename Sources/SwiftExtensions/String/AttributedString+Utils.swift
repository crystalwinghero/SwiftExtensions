//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

public extension NSAttributedString {
    convenience init(htmlString : String) {
        guard let encodedData = htmlString.data(using: .utf8) else {
            self.init(string: htmlString)
            return
        }
        
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            try self.init(data: encodedData,
                          options: attributedOptions,
                          documentAttributes: nil)
        } catch {
            self.init(string: htmlString)
        }
    }
}
public extension NSMutableAttributedString {
    
    func setAsLink(textToFind:String, linkURL:String) -> Bool {
        
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
    func replace(text: String, to newText : String, link : URL, attributes : [NSAttributedString.Key:Any] = [:]) {
        // Set new attributed string
        var newAttributes : [NSAttributedString.Key : Any] = attributes
        newAttributes[.link] = link
        if newAttributes[.foregroundColor] == nil {
            newAttributes[.foregroundColor] = UIColor.systemBlue
        }
        let newAttributedString = NSMutableAttributedString(string: newText, attributes: newAttributes)
        
        // Get range of text to replace
        guard let range = self.string.range(of: text) else { exit(0) }
        let nsRange = NSRange(range, in: self.string)
        
        // Replace content in range with the new content
        self.replaceCharacters(in: nsRange, with: newAttributedString)
    }
}
