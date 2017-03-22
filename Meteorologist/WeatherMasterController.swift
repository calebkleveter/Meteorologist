//
//  WeatherMasterController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherMasterController: UIViewController {

    let weatherFetch = JSONFetcher()
    var daily: [DailyWeather] = []
    let dailyWeatherView = WeatherTableView()
    let dailyWeatherTable = DailyWeatherTable()
    let locationManager = LocationManager()
    let locationPickerController = LocationPickerController()
    var currentLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = GradientView(frame: self.view.frame)
        
        self.dailyWeatherTable.refreshControl = UIRefreshControl()
        self.dailyWeatherTable.refreshControl?.addTarget(self, action: #selector(WeatherMasterController.tableRefresh), for: UIControlEvents.allEvents)
        
        dailyWeatherView.delegate = self
        locationPickerController.delegate = self
        
        locationManager.delegate = self
        locationManager.getUserPermission()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        weatherFetch.getJSON(from: constructAPIURL(from: currentLocation)) { (current, daily) in
            self.dailyWeatherView.reloadData(from: current)
            self.daily = daily
            self.assignDelegates()
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

    func refresh(from location: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        weatherFetch.getJSON(from: constructAPIURL(from: location)) { (current, daily) in
            self.dailyWeatherView.reloadData(from: current)
            self.daily = daily
            DispatchQueue.main.async {
                self.dailyWeatherTable.reloadData()
            }
        }

    }
    
    func tableRefresh(_ sender: AnyObject?) {
        self.locationManager.locationManager.requestLocation()
        self.refresh(from: currentLocation.coordinate)
        self.dailyWeatherTable.refreshControl?.endRefreshing()
    }
    
    func assignDelegates() {
        if self.dailyWeatherTable.dataSource == nil && self.dailyWeatherTable.delegate == nil {
            self.dailyWeatherTable.dataSource = self
            self.dailyWeatherTable.delegate = self
        }
    }
}

// MARK: - UITableViewDataSource
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

// MARK: - UITableViewDelegate
extension WeatherMasterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let detailController = WeatherDetailController(with: daily[indexPath.row], day: (cell as? DailyWeatherCell)?.dateLabel.text ?? "N/A")
            self.show(detailController, sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

// MARK: - LocationManagerDelegate
extension WeatherMasterController: LocationManagerDelegate {
    func locationDidUpdate(with location: CLLocation) {
        self.currentLocation = location
    }
}

// MARK: - WeatherTableViewDelegate
extension WeatherMasterController: WeatherTableViewDelegate {
    func locationButtonWasSelected() {
        self.present(locationPickerController, animated: true, completion: nil)
    }
}

// MARK: - LocationPickerContollerDelegate
extension WeatherMasterController: LocationPickerContollerDelegate {
    func dismissedWith(location: CLLocationCoordinate2D) {
        self.refresh(from: location)
    }
    
    func dismissedWithCurrentLocation() {
        self.refresh(from: currentLocation.coordinate)
    }
}




