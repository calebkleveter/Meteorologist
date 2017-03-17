//
//  DetailWeatherView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/6/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class DetailWeatherView: UIView {
    lazy var weatherIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .unSupported, with: 76)
        return label
    }()
}
