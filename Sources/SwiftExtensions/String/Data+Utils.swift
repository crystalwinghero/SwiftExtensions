//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation

public extension Data {
    var unicodeString: String? { string(as: .unicode) }
    var utf8String : String? { string(as: .utf8) }
    
    func string(as encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    func toDictionary() -> [String:Any] {
        do {
            if let json = try JSONSerialization.jsonObject(with: self, options: []) as? [String:Any] {
                return json
            }
        } catch {
            #if DEBUG
            print(#function, "[ERROR]", error)
            #endif
        }
        return [:]
    }
}

public extension Dictionary {
    var jsonStringRepresentation: String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil
        }
        return data.utf8String
    }
    var jsonDataRepresentation : Data? {
        jsonStringRepresentation?.data(using: .utf8)
    }
    var queryStringRepresentation : String {
        var res : [String] = []
        for (k, e) in self {
            res.append("\(k)=" + "\(e)".url_encoded())
        }
        return res.joined(separator: "&")
    }
    var queryDataRepresentation : Data? {
        queryStringRepresentation.data(using: .utf8)
    }
}
