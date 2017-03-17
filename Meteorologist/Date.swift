//
//  Date.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/6/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

extension Date {
    static func abbreviatedDate(advancedBy advance: Int = 0) -> String {
        let date = Date()
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "MMM d"
        let formattedDate = dateFomatter.string(from: date.addingTimeInterval(TimeInterval(60 * 60 * 24 * advance)))
        return formattedDate
    }
}
