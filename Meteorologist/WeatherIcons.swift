//
//  WeatherIcons.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 2/13/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation
import UIKit

struct WeatherIcon {
    enum Icon {
        case clearDay
        case clearNight
        case rain
        case snow
        case sleet
        case wind
        case fog
        case cloudy
        case partlyCloudyDay
        case partlyCloudyNight
        case unSupported
        case up
        case down
        case humidity
        
        var hex: String {
            switch self {
            case .clearDay: return "\u{00d}"
            case .clearNight: return "\u{02e}"
            case .rain: return "\u{019}"
            case .snow: return "\u{01b}"
            case .sleet: return "\u{0b5}"
            case .wind: return "\u{050}"
            case .fog: return "\u{014}"
            case .cloudy: return "\u{013}"
            case .partlyCloudyDay: return "\u{002}"
            case .partlyCloudyNight: return "\u{086}"
            case .unSupported: return "\u{07b}"
            case .up: return "\u{058}"
            case .down: return "\u{044}"
            case .humidity: return "\u{07a}"
            }
        }
    }
}
