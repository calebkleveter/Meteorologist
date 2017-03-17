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
    
    lazy var precipChanceIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .precipitation, with: 20)
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
    
    lazy var maxTempIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .up, with: 20)
        return label
    }()
    
    lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "100º"
        return label
    }()
    
    lazy var minTempIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .down, with: 20)
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "100%"
        return label
    }()
    
    lazy var humidityIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .humidity, with: 20)
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "100mph"
        return label
    }()
    
    lazy var windSpeedIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .wind, with: 20)
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        // FIXME: - Remove placholder
        label.text = "Really super long two line summary that needs a tall label. There, that should be enough text."
        return label
    }()
    
    lazy var attributionImage: UIImage = {
        if let image = UIImage(named: "poweredby-online") {
            return image
        } else { fatalError("Image does not exist") }
    }()
    
    lazy var attributionSelectGesture: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self.attributionImage, action: #selector(DetailWeatherView.attributionSelector))
    }()
    
    @objc func attributionSelector() {
        if let url = URL(string: "https://darksky.net/poweredby/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
