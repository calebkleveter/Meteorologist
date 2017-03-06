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
        var formattedDate = ""
        var loopCounter = 0
        let formattedDateChars = dateFomatter.string(from: date).characters
        for char in dateFomatter.string(from: date).characters {
            if loopCounter == formattedDateChars.count - 1 {
                formattedDate += String(Int(String(char))! + advance)
            } else { formattedDate += String(char) }
            loopCounter += 1
        }
        return formattedDate
    }
}
