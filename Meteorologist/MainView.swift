//
//  MainView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 11/30/19.
//  Copyright © 2019 Caleb Kleveter. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var weather: Weather

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            CurrentWeatherView(data: self.weather.current)
            ForecastList(weather: self.weather.daily)
        }
    }
}

extension MainView {
    static let start = MainView(
        weather: .init(
            current: .init(
                icon: .unSupported,
                precipChance: 0.0,
                currentTemp: 0.0,
                humidity: 0.0,
                windSpeed: 0.0,
                summary: "Unknown",
                maxTemp: 0.0,
                minTemp: 0.0
            ),
            daily: []
        )
    )
}

#if DEBUG

struct MainView_Preview: PreviewProvider {
    static var previews: MainView {
        let current = CurrentWeather(
            icon: .rain, precipChance: 0.9, currentTemp: 66.1, humidity: 0.83,
            windSpeed: 5.59, summary: "Drizzle", maxTemp: 66.35, minTemp: 52.08
        )

        let daily = [
            DailyWeather(
                icon: .rain,
                summary: "Dizzley and damp all the day through...",
                precipChance: 0.9,
                maxTemp: 66.35,
                minTemp: 52.08,
                humidity: 0.83,
                windSpeed: 5.59
            ),
            DailyWeather(
                icon: .clearDay,
                summary: "Balmy with a chance of Saint Elmo's Fire",
                precipChance: 0.19,
                maxTemp: 86.1,
                minTemp: 79.6,
                humidity: 0.77,
                windSpeed: 7.31
            )
        ]

        let weather = Weather(
            current: current,
            daily: daily
        )

        return MainView(weather: weather)
    }
}

#endif
