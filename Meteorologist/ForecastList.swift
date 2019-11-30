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
        let icon: WeatherIcon.Icon
        let date: String

        var id: String { self.date }
    }

    @State var days: [Day]

    init(icons: [WeatherIcon.Icon]) {
        self._days = State(wrappedValue:
            icons.enumerated().map { offset, icon in
                Day(icon: icon, date: Date.abbreviatedDate(advancedBy: offset))
            }
        )
    }

    var body: some View {
        List(self.days, rowContent: { day in
            HStack(alignment: .center, spacing: 15) {
                Text(day.date).font(.system(size: 30))
                day.icon.text(size: 40)
            }
        })
    }
}

#if DEBUG

struct ForecastList_Preview: PreviewProvider {
    static var previews: ForecastList {
        return ForecastList(icons: Array(repeating: .unSupported, count: 7))
    }
}

#endif
