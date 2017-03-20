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
    var weatherView: DetailWeatherView?
    
    init(with weatherData: DailyWeather) {
        self.weatherData = weatherData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        weatherView = DetailWeatherView(frame: self.view.frame)
        weatherView?.reloadData(with: weatherData)
        guard let view = weatherView else { fatalError("Init did not work") }
        self.view.addSubview(view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
