//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation

public extension Int {
    func between(_ a : Int, _ b: Int) -> Bool {
        return self >= a && self <= b
    }
    
    func timestampAsDate() -> Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    
    func toInt64() -> Int64 { return Int64(self) }
}


public extension Int64 {
    func toInt() -> Int { return Int(self) }
    func toNonZeroInt() -> Int? { return self > 0 ? Int(self) : nil }
    func toUnsignedInt() -> Int? { return self >= 0 ? Int(self) : nil }
}

public extension Array where Element == Int {
    func joined(separator: String = "") -> String {
        return self.map({ "\($0)" }).joined(separator: separator)
    }
    func sum() -> Int { self.reduce(0, +) }
}

public func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r != 0 { return gcd(b, r) }
    return b
}

public func sum(_ args : Int...) -> Int {
    return args.sum()
}

public func unwrap<T>(_ any: T) -> Any {
    let mirror = Mirror(reflecting: any)
    guard mirror.displayStyle == .optional, let first = mirror.children.first else {
        return any
    }
    return unwrap(first.value)
}
