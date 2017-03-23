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
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        return label
    }()
    
    lazy var weatherIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .partlyCloudyDay, with: 87)
        label.textAlignment = .center
        return label
    }()
    
    lazy var precipChanceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    lazy var precipChanceIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .precipitation, with: 46)
        label.textAlignment = .center
        return label
    }()
    
    lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    lazy var maxTempIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .up, with: 35)
        label.textAlignment = .center
        return label
    }()
    
    lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    lazy var minTempIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .down, with: 35)
        label.textAlignment = .center
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    lazy var humidityIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .humidity, with: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    lazy var windSpeedIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .wind, with: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    lazy var attributionButton: UIButton = {
        let image = UIImage(named: "poweredby-oneline")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(DetailWeatherView.attributionSelector), for: .touchUpInside)
        return button
        
    }()
    
    func attributionSelector(_ sender: AnyObject?) {
        if let url = URL(string: "https://darksky.net/poweredby/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        self.addGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData(with weather: DailyWeather) {
        if let max = weather.maxTemp { self.maxTempLabel.text = "\(Float(roundf(max*10)/10))º" } else { self.maxTempLabel.text = "N/A" }
        if let min = weather.minTemp { self.minTempLabel.text = "\(Float(roundf(min*10)/10))º" } else { self.minTempLabel.text = "N/A" }
        if let precip = weather.precipChance { self.precipChanceLabel.text = "\(Int(roundf(precip*1000)/10))%" } else { self.precipChanceLabel.text = "N/A" }
        if let humidity = weather.humidity { self.humidityLabel.text = "\(Int(roundf(humidity*1000)/10))%" } else { self.humidityLabel.text = "N/A" }
        if let windSpeed = weather.windSpeed { self.windSpeedLabel.text = "\(Int(roundf(windSpeed*10)/10))mph" } else { self.windSpeedLabel.text = "N/A" }
        WeatherIcon.set(self.weatherIcon, textTo: weather.icon, with: 76)
        self.summaryLabel.text = weather.summary
    }
    
    func configureLayout() {
        
        let smallLabelWidths = (self.frame.size.width) / 5
        
        self.addSubview(dayLabel)
        self.addSubview(weatherIcon)
        self.addSubview(precipChanceLabel)
        self.addSubview(precipChanceIcon)
        self.addSubview(maxTempLabel)
        self.addSubview(maxTempIcon)
        self.addSubview(minTempLabel)
        self.addSubview(minTempIcon)
        self.addSubview(humidityLabel)
        self.addSubview(humidityIcon)
        self.addSubview(windSpeedLabel)
        self.addSubview(windSpeedIcon)
        self.addSubview(summaryLabel)
        self.addSubview(attributionButton)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        precipChanceLabel.translatesAutoresizingMaskIntoConstraints = false
        precipChanceIcon.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempIcon.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempIcon.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityIcon.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedIcon.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        attributionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                  NSLayoutConstraint(item: dayLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 78),
                  dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  dayLabel.widthAnchor.constraint(equalToConstant: self.frame.size.width - 86),
                  dayLabel.heightAnchor.constraint(equalToConstant: 37),
                  
                  NSLayoutConstraint(item: weatherIcon, attribute: .top, relatedBy: .equal, toItem: dayLabel, attribute: .bottom, multiplier: 1.0, constant: 29),
                  weatherIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  weatherIcon.heightAnchor.constraint(equalToConstant: 125),
                  weatherIcon.widthAnchor.constraint(equalToConstant: 125),
                  
                  NSLayoutConstraint(item: precipChanceIcon, attribute: .top, relatedBy: .equal, toItem: weatherIcon, attribute: .bottom, multiplier: 1.0, constant: 54),
                  NSLayoutConstraint(item: precipChanceIcon, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                  precipChanceIcon.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  precipChanceIcon.heightAnchor.constraint(equalToConstant: 32),
                  
                  NSLayoutConstraint(item: humidityIcon, attribute: .top, relatedBy: .equal, toItem: weatherIcon, attribute: .bottom, multiplier: 1.0, constant: 54),
                  NSLayoutConstraint(item: humidityIcon, attribute: .left, relatedBy: .equal, toItem: precipChanceIcon, attribute: .right, multiplier: 1.0, constant: 0),
                  humidityIcon.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  humidityIcon.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: windSpeedIcon, attribute: .top, relatedBy: .equal, toItem: weatherIcon, attribute: .bottom, multiplier: 1.0, constant: 54),
                  NSLayoutConstraint(item: windSpeedIcon, attribute: .left, relatedBy: .equal, toItem: humidityIcon, attribute: .right, multiplier: 1.0, constant: 0),
                  windSpeedIcon.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  windSpeedIcon.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: maxTempIcon, attribute: .top, relatedBy: .equal, toItem: weatherIcon, attribute: .bottom, multiplier: 1.0, constant: 54),
                  NSLayoutConstraint(item: maxTempIcon, attribute: .left, relatedBy: .equal, toItem: windSpeedIcon, attribute: .right, multiplier: 1.0, constant: 0),
                  maxTempIcon.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  maxTempIcon.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: minTempIcon, attribute: .top, relatedBy: .equal, toItem: weatherIcon, attribute: .bottom, multiplier: 1.0, constant: 54),
                  NSLayoutConstraint(item: minTempIcon, attribute: .left, relatedBy: .equal, toItem: maxTempIcon, attribute: .right, multiplier: 1.0, constant: 0),
                  minTempIcon.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  minTempIcon.heightAnchor.constraint(equalToConstant: 32),
                  
                  NSLayoutConstraint(item: precipChanceLabel, attribute: .top, relatedBy: .equal, toItem: precipChanceIcon, attribute: .bottom, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: precipChanceLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                  precipChanceLabel.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  precipChanceLabel.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: humidityLabel, attribute: .top, relatedBy: .equal, toItem: humidityIcon, attribute: .bottom, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: humidityLabel, attribute: .left, relatedBy: .equal, toItem: precipChanceLabel, attribute: .right, multiplier: 1.0, constant: 0),
                  humidityLabel.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  humidityLabel.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: windSpeedLabel, attribute: .top, relatedBy: .equal, toItem: windSpeedIcon, attribute: .bottom, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: windSpeedLabel, attribute: .left, relatedBy: .equal, toItem: humidityLabel, attribute: .right, multiplier: 1.0, constant: 0),
                  windSpeedLabel.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  windSpeedLabel.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: maxTempLabel, attribute: .top, relatedBy: .equal, toItem: maxTempIcon, attribute: .bottom, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: maxTempLabel, attribute: .left, relatedBy: .equal, toItem: windSpeedLabel, attribute: .right, multiplier: 1.0, constant: 0),
                  maxTempLabel.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  maxTempLabel.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: minTempLabel, attribute: .top, relatedBy: .equal, toItem: minTempIcon, attribute: .bottom, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: minTempLabel, attribute: .left, relatedBy: .equal, toItem: maxTempLabel, attribute: .right, multiplier: 1.0, constant: 0),
                  minTempLabel.widthAnchor.constraint(equalToConstant: smallLabelWidths),
                  minTempLabel.heightAnchor.constraint(equalToConstant: 32),

                  NSLayoutConstraint(item: summaryLabel, attribute: .top, relatedBy: .equal, toItem: minTempLabel, attribute: .bottom, multiplier: 1.0, constant: 50),
                  NSLayoutConstraint(item: summaryLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 20),
                  NSLayoutConstraint(item: summaryLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -20),
                  summaryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  
                  NSLayoutConstraint(item: attributionButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: attributionButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                  NSLayoutConstraint(item: attributionButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                  attributionButton.heightAnchor.constraint(equalToConstant: self.frame.size.width * 0.22)
            ])
    }
}
