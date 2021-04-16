//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import Foundation


@available(iOS 10.0, *)
public extension Timer {
    @discardableResult
    static func after(_ interval: TimeInterval, _ execute: @escaping (Timer) -> Void) -> Timer {
        return Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { timer in
            execute(timer)
        })
    }
    @discardableResult
    static func every(_ interval: TimeInterval, _ execute: @escaping (Timer) -> Void) -> Timer {
        return Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { timer in
            execute(timer)
        })
    }
    
}

public extension Date {
    
    func diff(_ date: Date?) -> TimeInterval {
        if date == nil { return TimeInterval.greatestFiniteMagnitude }
        return self.timeIntervalSince1970 - date!.timeIntervalSince1970
    }
    func ms() -> String{
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSZ"
        return f.string(from: self)
    }
    func display(format : String, locale : Locale? = nil, calendar : Calendar? = nil) -> String {
        let f = DateFormatter()
        f.dateFormat = format
        if let l = locale { f.locale = l }
        if let c = calendar { f.calendar = c }
        else {
            var cal = Calendar(identifier: .gregorian)
            cal.timeZone = TimeZone.current
            f.calendar = cal
        }
        return f.string(from: self)
    }
    
}
