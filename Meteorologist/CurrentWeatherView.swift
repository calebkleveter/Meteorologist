//
//  TodayWeatherView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 11/30/19.
//  Copyright © 2019 Caleb Kleveter. All rights reserved.
//

import SwiftUI

struct CurrentWeatherView: View {
    @State var data: CurrentWeather

    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            self.icon
            VStack(alignment: .center, spacing: 15) {
                Text((self.data.currentTemp?.description ?? "N/A") + "º")
                    .font(.system(size: 30))
                    .padding(.bottom)
                self.moisture
                self.wind
            }
        }
    }

    var icon: some View {
        VStack(alignment: .center, spacing: 15) {
            self.data.icon.text(size: 87)
            Text(self.data.summary).font(.system(size: 20))
        }.padding()
    }

    var wind: some View {
        let wind = self.data.windSpeed.map { Int(roundf($0 * 10) / 10) }
        return HStack(alignment: .center, spacing: 15) {
            WeatherIcon.Icon.wind.text(size: 20)
            Text((wind?.description ?? "N/A") + "mph")
            Spacer(minLength: 10)
        }.padding(.horizontal)
    }

    var moisture: some View {
        let precipitation = self.data.precipChance.map {
            Float(roundf($0 * 1000) / 10)
        }
        let humidity = self.data.humidity.map {
            Float(roundf($0 * 1000 ) / 10)
        }

        return HStack(alignment: .center, spacing: 15) {
            WeatherIcon.Icon.precipitation.text(size: 20)
            Text((precipitation?.description ?? "N/A") + "%").font(.system(size: 20))
            Spacer(minLength: 1)
            WeatherIcon.Icon.humidity.text(size: 20)
            Text((humidity?.description ?? "N/A") + "%").font(.system(size: 20))
        }.padding(.horizontal)
    }
}

#if DEBUG

struct CurrentWeather_Preview: PreviewProvider {
    static var previews: CurrentWeatherView {
        let data = CurrentWeather(
            icon: .rain, precipChance: 0.9, currentTemp: 66.1, humidity: 0.83,
            windSpeed: 5.59, summary: "Drizzle", maxTemp: 66.35, minTemp: 52.08
        )

        return CurrentWeatherView(data: data)
    }
}

#endif
