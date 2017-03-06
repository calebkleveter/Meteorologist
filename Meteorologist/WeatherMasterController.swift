//
//  WeatherMasterController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class WeatherMasterController: UIViewController {

//    let weatherFetch = JSONFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = GradientView(frame: self.view.frame)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let dailyWeatherView = WeatherTableView(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200))
        let dailyWeatherTable = DailyWeatherTable(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 200), style: .plain)
        self.view.addSubview(dailyWeatherView)
        self.view.addSubview(dailyWeatherTable)
        
//        weatherFetch.getJSON(from: "https://api.darksky.net/forecast/e49cd06c8aaa9bd242728c21a1058b5f/37.8267,-122.4233") { (current, daily) in
//            dailyWeatherView.reloadData(from: current)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
