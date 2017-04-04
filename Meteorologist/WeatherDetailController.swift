//
//  WeatherDetailController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/10/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class WeatherDetailController: UIViewController {

    let weatherData: DailyWeather
    let detailDay: String
    var weatherView: DetailWeatherView?
    var weatherDataView: DetailWeatherDataView?
    var gradientView: GradientView? = nil
    
    init(with weatherData: DailyWeather, day: String) {
        self.weatherData = weatherData
        self.detailDay = day
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .gray
        
        weatherView = DetailWeatherView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height / 2))
        weatherDataView = DetailWeatherDataView(frame: CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: self.view.frame.size.height / 2))
        weatherView?.reloadData(with: weatherData)
        weatherDataView?.reloadData(with: weatherData)
        weatherView?.dayLabel.text = detailDay
        guard let weatherView = weatherView else { fatalError("Init did not work") }
        guard let weatherDataView = weatherDataView else { fatalError("Data init failed") }
        self.view.addSubview(weatherView)
        self.view.addSubview(weatherDataView)
        
        switch UIDevice.current.orientation {
        case .landscapeLeft:
            weatherView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height)
            weatherDataView.frame = CGRect(x: self.view.frame.width / 2, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height)
        case .landscapeRight:
            weatherView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.size.height)
            weatherDataView.frame = CGRect(x: self.view.frame.size.width / 2, y: 0, width: self.view.frame.width / 2, height: self.view.frame.size.height)
        case .portrait:
            weatherView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height / 2)
            weatherDataView.frame = CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: self.view.frame.size.height / 2)
        case .portraitUpsideDown:
            weatherView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height / 2)
            weatherDataView.frame = CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: self.view.frame.size.height / 2)
        default: break
        }
        weatherDataView.configureLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        _ = self.view.subviews.map { $0.removeFromSuperview() }
        
        self.view.addGradient()
        
        switch UIDevice.current.orientation {
        case .landscapeLeft:
            weatherView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height)
            weatherDataView?.frame = CGRect(x: self.view.frame.width / 2, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height)
        case .landscapeRight:
            weatherView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.size.height)
            weatherDataView?.frame = CGRect(x: self.view.frame.size.width / 2, y: 0, width: self.view.frame.width / 2, height: self.view.frame.size.height)
        case .portrait:
            weatherView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height / 2)
            weatherDataView?.frame = CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: self.view.frame.size.height / 2)
        case .portraitUpsideDown:
            weatherView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height / 2)
            weatherDataView?.frame = CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: self.view.frame.size.height / 2)
        default: break
        }
        self.view.addSubview(weatherView!)
        self.view.addSubview(weatherDataView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
