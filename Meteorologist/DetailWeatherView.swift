//
//  DetailWeatherView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/6/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class DetailWeatherView: UIView {
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "October 23"
        return label
    }()
    
    lazy var weatherIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .unSupported, with: 76)
        return label
    }()
    
    lazy var precipChanceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "100%"
        return label
    }()
    
    lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "100º"
        return label
    }()
}
