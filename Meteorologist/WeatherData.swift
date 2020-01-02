//
//  WeatherData.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let current: CurrentWeather
    let daily: [DailyWeather]

    init(current: CurrentWeather, daily: [DailyWeather]) {
        self.current = current
        self.daily = daily
    }

    init(from decoder: Decoder) throws {
        self.current = try CurrentWeather(from: decoder)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        let daily = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        self.daily = try daily.decode([DailyWeather].self, forKey: .data)
    }

    enum CodingKeys: String, CodingKey {
        case daily
        case data
    }
}

struct DailyWeather: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case icon
        case summary
        case precipChance = "precipProbability"
        case maxTemp = "temperatureMax"
        case minTemp = "temperatureMin"
        case humidity
        case windSpeed

    }
}

struct CurrentWeather: Decodable {
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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let current = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .currently)

        self.icon = try current.decode(WeatherIcon.Icon.self, forKey: .icon)
        self.precipChance = try current.decodeIfPresent(Float.self, forKey: .precipChance)
        self.currentTemp = try current.decodeIfPresent(Float.self, forKey: .currentTemp)
        self.humidity = try current.decodeIfPresent(Float.self, forKey: .humidity)
        self.windSpeed = try current.decodeIfPresent(Float.self, forKey: .windSpeed)
        self.summary = try current.decode(String.self, forKey: .summary)


        let daily = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        var data = try daily.nestedUnkeyedContainer(forKey: .data)
        let today = try data.decode(DailyWeather.self)

        self.maxTemp = today.maxTemp
        self.minTemp = today.minTemp
    }

    enum CodingKeys: String, CodingKey {
        case currently
        case daily
        case data

        case icon
        case precipChance = "precipProbability"
        case currentTemp = "temperature"
        case humidity
        case windSpeed
        case summary
        case maxTemp = "temperatureMax"
        case minTemp = "temperatureMin"
    }
}
