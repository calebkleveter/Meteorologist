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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        weatherView = DetailWeatherView(frame: self.view.frame)
        weatherView?.reloadData(with: weatherData)
        weatherView?.dayLabel.text = detailDay
        guard let view = weatherView else { fatalError("Init did not work") }
        self.view.addSubview(view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
