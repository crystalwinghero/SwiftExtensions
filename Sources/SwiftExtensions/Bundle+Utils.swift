//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation

public extension Bundle {
    var appName : String {
        return  Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    }
    var version : String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    var build : String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    var buildNumber : Int {
        return Int(self.build) ?? 0
    }
}
