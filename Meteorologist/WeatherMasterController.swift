//
//  WeatherMasterController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class WeatherMasterController: UIViewController {

    let weatherFetch = JSONFetcher()
    var daily: [DailyWeather] = []
    let dailyWeatherView = WeatherTableView()
    let dailyWeatherTable = DailyWeatherTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = GradientView(frame: self.view.frame)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        weatherFetch.getJSON(from: "https://api.darksky.net/forecast/e49cd06c8aaa9bd242728c21a1058b5f/37.8267,-122.4233") { (current, daily) in
            self.dailyWeatherView.reloadData(from: current)
            self.daily = daily
            self.dailyWeatherTable.dataSource = self
        }
        
        dailyWeatherView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
        
        dailyWeatherTable.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: self.view.frame.size.height - 250)
        dailyWeatherTable.rowHeight = 75
        
        self.view.addSubview(dailyWeatherView)
        self.view.addSubview(dailyWeatherTable)
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

extension WeatherMasterController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DailyWeatherCell()
        cell.dateLabel.text = Date.abbreviatedDate(advancedBy: indexPath.row)
        WeatherIcon.set(cell.iconLabel, textTo: daily[indexPath.row].icon, with: 40)
        return cell
    }
}

extension WeatherMasterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let detailController = WeatherDetailController(with: daily[indexPath.row])
            detailController.weatherView.dayLabel.text = (cell as? DailyWeatherCell)?.dateLabel.text ?? "N/A"
            self.show(detailController, sender: self)
        }
    }
}
