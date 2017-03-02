//
//  WeatherData.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

struct DailyWeather {}

struct CurrentWeather: JSONInitable {
    let icon: WeatherIcon.Icon
    let precipChance: Int?
    let currentTemp: Int?
    let humidity: Int?
    
    init(json: JSON) {
        icon = WeatherIcon.Icon.getIcon(from: "\(json["icon"] ?? ("" as AnyObject))")
        precipChance = Int("\(json["precipProbability"] ?? ("" as AnyObject))")
        currentTemp = Int("\(json["temperature"] ?? ("" as AnyObject))")
        humidity = Int("\(json["humidity"] ?? ("" as AnyObject))")
    }
}
