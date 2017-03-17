//
//  WeatherDetailController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/10/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class WeatherDetailController: UIViewController {

    let weatherView = DetailWeatherView()
    let weatherData: DailyWeather
    
    init(with weatherData: DailyWeather) {
        self.weatherData = weatherData
        super.init(nibName: nil, bundle: nil)
        weatherView.reloadData(with: weatherData)
        weatherView.frame = view.frame
        self.view = weatherView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
