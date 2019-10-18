//
//  Date+convertToString.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import Foundation

// not implementing this yet
extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
