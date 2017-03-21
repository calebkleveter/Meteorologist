//
//  WeatherTableView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 2/27/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class WeatherTableView: UIView {
    lazy var tempHighIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .up, with: 36)
        return label
    }()
    
    lazy var tempHighLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100º"
        return label
    }()
    
    lazy var tempLowIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .down, with: 36)
        return label
    }()
    
    lazy var tempLowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100º"
        return label
    }()
    
    lazy var precipChanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100%"
        label.textAlignment = .right
        return label
    }()
    
    lazy var precipChanceIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .precipitation, with: 36)
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100%"
        label.textAlignment = .right
        return label
    }()
    
    lazy var humidityIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .humidity, with: 20)
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100mph"
        label.textAlignment = .right
        return label
    }()
    
    lazy var windSpeedIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .wind, with: 20)
        return label
    }()
    
    lazy var currentWeatherIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .unSupported, with: 71)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    lazy var currentTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100.0º"
        label.textAlignment = .center
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "Really long weather summary that goes out of the frame of the iPhone screen."
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    lazy var changeLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.setImage(UIImage(named: "ios-location"), for: UIControlState.normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(WeatherTableView.locationButtonSelected), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func locationButtonSelected(_ sender: AnyObject?) {
        // Thanks to @mxcl for this code to get the UIViewController! http://stackoverflow.com/questions/1372977/given-a-view-how-do-i-get-its-viewcontroller
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                
                // Check to see if the UIViewController is a WeatherMasterController.
                if let controller = viewController as? WeatherMasterController {
                    controller.locationManager.getLocationName(from: controller.currentLocation, with: "City", endingWith: { (city) in
                        
                        let locationAlert = UIAlertController(title: city, message: nil, preferredStyle: .alert)
                        locationAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                        controller.present(locationAlert, animated: true, completion: nil)
                    })
                }

            }
        }
    }
    
    func reloadData(from weather: CurrentWeather) {
        DispatchQueue.main.async {
            if let max = weather.maxTemp { self.tempHighLabel.text = "\(Float(roundf(max*10)/10))º" } else { self.tempHighLabel.text = "N/A" }
            if let min = weather.minTemp { self.tempLowLabel.text = "\(Float(roundf(min*10)/10))º" } else { self.tempLowLabel.text = "N/A" }
            if let precip = weather.precipChance { self.precipChanceLabel.text = "\(Float(roundf(precip*1000)/10))%" } else { self.precipChanceLabel.text = "N/A" }
            if let humidity = weather.humidity { self.humidityLabel.text = "\(Float(roundf(humidity*1000)/10))%" } else { self.humidityLabel.text = "N/A" }
            if let windSpeed = weather.windSpeed { self.windSpeedLabel.text = "\(Int(roundf(windSpeed*10)/10))mph" } else { self.windSpeedLabel.text = "N/A" }
            if let currentTemp = weather.currentTemp { self.currentTempLabel.text = "\(Float(roundf(currentTemp*10)/10))º" } else { self.currentTempLabel.text = "N/A" }
            WeatherIcon.set(self.currentWeatherIcon, textTo: weather.icon, with: 71)
            self.summaryLabel.text = weather.summary
        }
    }
    
    func configureLayout() {
        self.addSubview(tempHighIcon)
        self.addSubview(tempHighLabel)
        self.addSubview(tempLowIcon)
        self.addSubview(tempLowLabel)
        self.addSubview(precipChanceLabel)
        self.addSubview(precipChanceIcon)
        self.addSubview(humidityLabel)
        self.addSubview(humidityIcon)
        self.addSubview(currentWeatherIcon)
        self.addSubview(summaryLabel)
        self.addSubview(windSpeedLabel)
        self.addSubview(windSpeedIcon)
        self.addSubview(currentTempLabel)
        self.addSubview(changeLocationButton)
        
        tempHighIcon.translatesAutoresizingMaskIntoConstraints = false
        tempHighLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLowIcon.translatesAutoresizingMaskIntoConstraints = false
        tempLowLabel.translatesAutoresizingMaskIntoConstraints = false
        precipChanceLabel.translatesAutoresizingMaskIntoConstraints = false
        precipChanceIcon.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityIcon.translatesAutoresizingMaskIntoConstraints = false
        currentWeatherIcon.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedIcon.translatesAutoresizingMaskIntoConstraints = false
        currentTempLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                NSLayoutConstraint(item: tempHighIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                NSLayoutConstraint(item: tempHighIcon, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 15),
                tempHighIcon.heightAnchor.constraint(equalToConstant: 20),
                tempHighIcon.widthAnchor.constraint(equalToConstant: 14),
                
                NSLayoutConstraint(item: tempHighLabel, attribute: .left, relatedBy: .equal, toItem: tempHighIcon, attribute: .right, multiplier: 1.0, constant: 10),
                NSLayoutConstraint(item: tempHighLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                tempHighLabel.heightAnchor.constraint(equalToConstant: 20),
                tempHighLabel.widthAnchor.constraint(equalToConstant: 60),
                
                NSLayoutConstraint(item: tempLowIcon, attribute: .top, relatedBy: .equal, toItem: tempHighIcon, attribute: .bottom, multiplier: 1.0, constant: 10),
                NSLayoutConstraint(item: tempLowIcon, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 15),
                tempLowIcon.heightAnchor.constraint(equalToConstant: 20),
                tempLowIcon.widthAnchor.constraint(equalToConstant: 14),
                
                NSLayoutConstraint(item: tempLowLabel, attribute: .left, relatedBy: .equal, toItem: tempLowIcon, attribute: .right, multiplier: 1.0, constant: 10),
                NSLayoutConstraint(item: tempLowLabel, attribute: .top, relatedBy: .equal, toItem: tempHighLabel, attribute: .bottom, multiplier: 1.0, constant: 10),
                tempLowLabel.heightAnchor.constraint(equalToConstant: 20),
                tempLowLabel.widthAnchor.constraint(equalToConstant: 60),
                
                NSLayoutConstraint(item: precipChanceLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -15),
                NSLayoutConstraint(item: precipChanceLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                precipChanceLabel.heightAnchor.constraint(equalToConstant: 20),
                precipChanceLabel.widthAnchor.constraint(equalToConstant: 60),
                
                NSLayoutConstraint(item: precipChanceIcon, attribute: .right, relatedBy: .equal, toItem: precipChanceLabel, attribute: .left, multiplier: 1.0, constant: -10),
                NSLayoutConstraint(item: precipChanceIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                precipChanceIcon.heightAnchor.constraint(equalToConstant: 27),
                precipChanceIcon.widthAnchor.constraint(equalToConstant: 17),
                
                NSLayoutConstraint(item: humidityLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -15),
                NSLayoutConstraint(item: humidityLabel, attribute: .top, relatedBy: .equal, toItem: precipChanceLabel, attribute: .bottom, multiplier: 1.0, constant: 10),
                humidityLabel.heightAnchor.constraint(equalToConstant: 20),
                humidityLabel.widthAnchor.constraint(equalToConstant: 60),
                
                NSLayoutConstraint(item: humidityIcon, attribute: .right, relatedBy: .equal, toItem: humidityLabel, attribute: .left, multiplier: 1.0, constant: -10),
                NSLayoutConstraint(item: humidityIcon, attribute: .top, relatedBy: .equal, toItem: precipChanceIcon, attribute: .bottom, multiplier: 1.0, constant: 3),
                humidityIcon.heightAnchor.constraint(equalToConstant: 25),
                humidityIcon.widthAnchor.constraint(equalToConstant: 17),
                
                NSLayoutConstraint(item: windSpeedLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -15),
                NSLayoutConstraint(item: windSpeedLabel, attribute: .top, relatedBy: .equal, toItem: humidityLabel, attribute: .bottom, multiplier: 1.0, constant: 10),
                windSpeedLabel.heightAnchor.constraint(equalToConstant: 20),
                windSpeedLabel.widthAnchor.constraint(equalToConstant: 75),
                
                NSLayoutConstraint(item: windSpeedIcon, attribute: .right, relatedBy: .equal, toItem: windSpeedLabel, attribute: .left, multiplier: 1.0, constant: -10),
                NSLayoutConstraint(item: windSpeedIcon, attribute: .top, relatedBy: .equal, toItem: humidityIcon, attribute: .bottom, multiplier: 1.0, constant: 3),
                windSpeedIcon.heightAnchor.constraint(equalToConstant: 25),
                windSpeedIcon.widthAnchor.constraint(equalToConstant: 25),
                
                NSLayoutConstraint(item: currentWeatherIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                currentWeatherIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                currentWeatherIcon.heightAnchor.constraint(equalToConstant: 100),
                currentWeatherIcon.widthAnchor.constraint(equalToConstant: 100),
                
                NSLayoutConstraint(item: currentTempLabel, attribute: .top, relatedBy: .equal, toItem: currentWeatherIcon, attribute: .bottom, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: currentTempLabel, attribute: .bottom, relatedBy: .equal, toItem: summaryLabel, attribute: .top, multiplier: 1.0, constant: 0),
                currentTempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                currentTempLabel.widthAnchor.constraint(equalToConstant: 100),
                
                NSLayoutConstraint(item: summaryLabel, attribute: .top, relatedBy: .equal, toItem: currentWeatherIcon, attribute: .bottom, multiplier: 1.0, constant: 25),
                NSLayoutConstraint(item: summaryLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 30),
                NSLayoutConstraint(item: summaryLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -30),
                summaryLabel.heightAnchor.constraint(equalToConstant: 52),
                
                NSLayoutConstraint(item: changeLocationButton, attribute: .top, relatedBy: .equal, toItem: tempLowIcon, attribute: .bottom, multiplier: 1.0, constant: 25),
                NSLayoutConstraint(item: changeLocationButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 15),
                changeLocationButton.heightAnchor.constraint(equalToConstant: 40),
                changeLocationButton.widthAnchor.constraint(equalToConstant: 40)
            ])
    }
}
