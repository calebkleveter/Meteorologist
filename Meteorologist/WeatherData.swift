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
    let maxTemp: WeatherIcon.Icon
    
    init(json: JSON) {
        maxTemp = WeatherIcon.Icon.getIcon(from: "\(json["icon"] ?? ("" as AnyObject))")
    }
}
