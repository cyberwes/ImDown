//
//  Formatter.swift
//  ImDown
//
//  Created by Wesley Hahn on 18/11/2023.
//

import Foundation


class Formatter {
    public static func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "H:mm | d/M/y"
            return dateFormatter.string(from: date)
        }
    
    public static func stringToDate(_ string: String) -> Date {
        return Date.now;
    }
}
