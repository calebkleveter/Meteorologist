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
    let precipChance: Float?
    let maxTemp: Float?
    let minTemp: Float?
    let humidity: Float?
    let windSpeed: Float?

    init(
        icon: WeatherIcon.Icon, summary: String, precipChance: Float?,
        maxTemp: Float?, minTemp: Float?, humidity: Float?, windSpeed: Float?
    ) {
        self.icon = icon
        self.summary = summary
        self.precipChance = precipChance
        self.maxTemp = maxTemp
        self.minTemp = minTemp
        self.humidity = humidity
        self.windSpeed = windSpeed
    }

    init(json: JSON) {
        icon = WeatherIcon.Icon.getIcon(from: "\(json["icon"] ?? ("" as AnyObject))")
        summary = "\(json["summary"] ?? ("N/A" as AnyObject))"
        precipChance = Float("\(json["precipProbability"] ?? ("" as AnyObject))")
        maxTemp = Float("\(json["temperatureMax"] ?? ("" as AnyObject))")
        minTemp = Float("\(json["temperatureMin"] ?? ("" as AnyObject))")
        humidity = Float("\(json["humidity"] ?? ("" as AnyObject))")
        windSpeed = Float("\(json["windSpeed"] ?? ("" as AnyObject))")
    }
}

struct CurrentWeather: JSONInitable {
    let icon: WeatherIcon.Icon
    let precipChance: Float?
    let currentTemp: Float?
    let humidity: Float?
    let windSpeed: Float?
    let summary: String
    let maxTemp: Float?
    let minTemp: Float?

    init(
        icon: WeatherIcon.Icon, precipChance: Float?, currentTemp: Float?, humidity: Float?,
        windSpeed: Float?, summary: String, maxTemp: Float?, minTemp: Float?
    ) {
        self.icon = icon
        self.precipChance = precipChance
        self.currentTemp = currentTemp
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.summary = summary
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }

    init(json: JSON) {
        let current = json["currently"] as? JSON
        icon = WeatherIcon.Icon.getIcon(from: "\(current?["icon"] ?? ("" as AnyObject))")
        precipChance = Float("\(current?["precipProbability"] ?? ("" as AnyObject))")
        currentTemp = Float("\(current?["temperature"] ?? ("" as AnyObject))")
        humidity = Float("\(current?["humidity"] ?? ("" as AnyObject))")
        windSpeed = Float("\(current?["windSpeed"] ?? ("" as AnyObject))")
        summary = "\(current?["summary"] ?? ("N/A" as AnyObject))"
        
        let daily = ((json["daily"] as? JSON)?["data"] as? [JSON])?[0]
        maxTemp = Float("\(daily?["temperatureMax"] ?? ("" as AnyObject))")
        minTemp = Float("\(daily?["temperatureMin"] ?? ("" as AnyObject))")
    }
}
