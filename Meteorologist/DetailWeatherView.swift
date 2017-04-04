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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData(with weather: DailyWeather) {
        WeatherIcon.set(self.weatherIcon, textTo: weather.icon, with: 76)
    }
    
    func addSubviews() {
        self.addSubview(dayLabel)
        self.addSubview(weatherIcon)

        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLayout() {
        
        NSLayoutConstraint.activate([
                  NSLayoutConstraint(item: dayLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 78),
                  dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  dayLabel.widthAnchor.constraint(equalToConstant: self.frame.size.width - 86),
                  dayLabel.heightAnchor.constraint(equalToConstant: 37),
                  
                  NSLayoutConstraint(item: weatherIcon, attribute: .top, relatedBy: .equal, toItem: dayLabel, attribute: .bottom, multiplier: 1.0, constant: 29),
                  weatherIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  weatherIcon.heightAnchor.constraint(equalToConstant: 125),
                  weatherIcon.widthAnchor.constraint(equalToConstant: 125),
            ])
    }
}
