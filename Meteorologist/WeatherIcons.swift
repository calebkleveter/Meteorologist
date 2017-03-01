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
    
    static func set(_ label: UILabel, textTo icon: Icon, with size: CGFloat) {
        label.textColor = .white
        label.font = UIFont(name: "weathericons-regular-webfont", size: size)
        label.text = icon.hex
        label.backgroundColor = .clear
    }
    
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
        case precipitation
        
        var hex: String {
            switch self {
            case .clearDay: return "\u{f00d}"
            case .clearNight: return "\u{f02e}"
            case .rain: return "\u{f019}"
            case .snow: return "\u{f01b}"
            case .sleet: return "\u{f0b5}"
            case .wind: return "\u{f050}"
            case .fog: return "\u{f014}"
            case .cloudy: return "\u{f013}"
            case .partlyCloudyDay: return "\u{f002}"
            case .partlyCloudyNight: return "\u{f086}"
            case .unSupported: return "\u{f07b}"
            case .up: return "\u{f058}"
            case .down: return "\u{f044}"
            case .humidity: return "\u{f07a}"
            case .precipitation: return "\u{f04e}"
            }
        }
    }
}
