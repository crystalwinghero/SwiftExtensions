//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation

public extension String {
    
    var isNotEmpty : Bool { !isEmpty }
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
        return trimmed.isEmpty
    }
    
    //Validate Email
    var isValidEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var isValidAlpha: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
    var isValidAlphaSpace : Bool {
        return !isEmpty && range(of: "[^ a-zA-Z]", options: .regularExpression) == nil
    }
}


public extension String {
    
    func preg_replace(_ pattern: String, _ with: String, _ options :  String.CompareOptions? = nil) -> String {
        let range: Range<Index> = self.startIndex..<self.endIndex
        return self.replacingOccurrences(of: pattern, with: with, options: options ?? .regularExpression, range: range)
        
    }
    
    func preg_match(_ pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func url_encoded(_ charSet : CharacterSet = .urlHostAllowed) -> String {
        return self.addingPercentEncoding(withAllowedCharacters: charSet) ?? ""
    }
    func query_encoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    var base64String : String {
        let data = self.data(using: String.Encoding.utf8)!
        return data.base64EncodedString(options: [])
    }
    
    static func loremIpsum() -> String {
        return """
        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
        
        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
        """
    }
}

public extension String {
    
    init(htmlString: String) {
        self.init()
        guard let encodedData = htmlString.data(using: .utf8) else {
            self = htmlString
            return
        }
        
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributedString = try NSAttributedString(data: encodedData,
                                                          options: attributedOptions,
                                                          documentAttributes: nil)
            self = attributedString.string
        } catch {
            self = htmlString
        }
    }
    
    func versionComponents() -> [Int] {
        return self.split(separator: ".").compactMap({ Int($0) })
    }
}

public extension String {
    
    func logString(length: Int = 40) -> String {
        return self.substr(start: 0, length: length)
    }
    func substr(start : Int, length: Int, trailing : String = "") -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
        return String(self[startIndex..<endIndex]) + trailing
    }
    
}

