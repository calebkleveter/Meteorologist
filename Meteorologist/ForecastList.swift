//
//  ForecastList.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 11/30/19.
//  Copyright © 2019 Caleb Kleveter. All rights reserved.
//

import SwiftUI

struct ForecastList: View {
    struct Day: Identifiable {
        let weather: DailyWeather
        let date: String

        var id: String { self.date }
    }

    @State var days: [Day]

    init(weather: [DailyWeather]) {
        self._days = State(wrappedValue:
            weather.enumerated().map { offset, day in
                Day(weather: day, date: Date.abbreviatedDate(advancedBy: offset))
            }
        )
    }

    var body: some View {
        List(self.days, rowContent: { day in
            HStack(alignment: .center, spacing: 15) {
                Text(day.date).font(.system(size: 30))
                day.weather.icon.text(size: 40)
            }
        })
    }
}

#if DEBUG

struct ForecastList_Preview: PreviewProvider {
    static var previews: ForecastList {
        let weather = [
            DailyWeather(icon: .clearDay, summary: "Mostly sunny, followed by large UFOs attacking from outerspace.", precipChance: 0.32, maxTemp: 53.0, minTemp: 32.5, humidity: 0.55, windSpeed: 3.2)
        ]

        return ForecastList(weather: weather)
    }
}

#endif
