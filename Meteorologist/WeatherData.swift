//
//  WeatherData.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

struct DailyWeather: JSONInitable {
    let icon: WeatherIcon.Icon
    let summary: String
    let precipChance: Int?
    let maxTemp: Int?
    
    init(json: JSON) {
        icon = WeatherIcon.Icon.getIcon(from: "\(json["icon"] ?? ("" as AnyObject))")
        summary = "\(json["summary"] ?? ("N/A" as AnyObject))"
        precipChance = Int("\(json["precipProbability"] ?? ("" as AnyObject))")
        maxTemp = Int("\(json["temperatureMax"] ?? ("" as AnyObject))")
    }
}

struct CurrentWeather: JSONInitable {
    let icon: WeatherIcon.Icon
    let precipChance: Int?
    let currentTemp: Int?
    let humidity: Int?
    let windSpeed: Int?
    let summary: String
    let maxTemp: Int?
    let minTemp: Int?
    
    init(json: JSON) {
        let current = json["currently"] as? JSON
        icon = WeatherIcon.Icon.getIcon(from: "\(current?["icon"] ?? ("" as AnyObject))")
        precipChance = Int("\(current?["precipProbability"] ?? ("" as AnyObject))")
        currentTemp = Int("\(current?["temperature"] ?? ("" as AnyObject))")
        humidity = Int("\(current?["humidity"] ?? ("" as AnyObject))")
        windSpeed = Int("\(current?["windSpeed"] ?? ("" as AnyObject))")
        summary = "\(current?["summary"] ?? ("N/A" as AnyObject))"
        
        let daily = ((json["daily"] as? JSON)?["data"] as? [JSON])?[0]
        maxTemp = Int("\(daily?["temperatureMax"] ?? ("" as AnyObject))")
        minTemp = Int("\(daily?["temperatureMin"] ?? ("" as AnyObject))")
    }
}
