//
//  Extensions.swift
//  WallYiOS
//
//  Created by Mihnea on 12/16/22.
//

import Foundation

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let string = dateFormatter.string(from: self).capitalized
        let index = string.index(string.startIndex, offsetBy: 3)
        return String(string.prefix(upTo: index))
    }
}

extension Notification.Name {
    static let refreshHomeScreen = Notification.Name("wallyios.refreshHomeScreen")
    static let refreshNetworthView = Notification.Name("wallyios.refreshNetworthView")
}
