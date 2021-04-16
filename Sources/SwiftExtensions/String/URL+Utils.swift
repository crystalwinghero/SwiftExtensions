//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation

public extension URL {
    var queryParams: [String: String] {
        var parameters = [String: String]()
        if let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false),
            let queryItems = urlComponents.queryItems {
            for queryItem in queryItems where queryItem.value != nil {
                parameters[queryItem.name] = queryItem.value
            }
        }
        return parameters
    }
}
