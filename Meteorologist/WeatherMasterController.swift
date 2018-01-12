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
        
        self.dailyWeatherTable.refreshControl = UIRefreshControl()
        self.dailyWeatherTable.refreshControl?.addTarget(self, action: #selector(WeatherMasterController.tableRefresh), for: UIControlEvents.allEvents)
        
        dailyWeatherView.delegate = self
        locationPickerController.delegate = self
        
        locationManager.delegate = self
        locationManager.getUserPermission()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Overview"
        self.navigationItem.backBarButtonItem = backButton
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        _ = self.view.subviews.filter({return ($0 as? GradientView) != nil }).map({ $0.removeFromSuperview() })
        
        self.view.addSubview(GradientView(frame: self.view.frame))
        
        switch UIDevice.current.orientation {
        case .landscapeLeft:
            dailyWeatherView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width / 2, height: self.view.frame.size.height - 50)
            dailyWeatherTable.frame = CGRect(x: self.view.frame.size.width / 2, y: 50, width: self.view.frame.size.width / 2, height: self.view.frame.size.height - 50)
        case .landscapeRight:
            dailyWeatherView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width / 2, height: self.view.frame.size.height - 50)
            dailyWeatherTable.frame = CGRect(x: self.view.frame.size.width / 2, y: 50, width: self.view.frame.size.width / 2, height: self.view.frame.size.height - 50)
        case .portrait:
            dailyWeatherView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
            dailyWeatherTable.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: self.view.frame.size.height - 250)
        case .portraitUpsideDown:
            dailyWeatherView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
            dailyWeatherTable.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: self.view.frame.size.height - 250)
        default: print("Unneeded information")
        }
        
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
        let url = URL.construct(from: location)
        weatherFetch.getJSON(from: url) { (current, daily) in
            self.dailyWeatherView.reloadData(from: current)
            self.daily = daily
            self.assignDelegates()
        }
        locationManager.getLocationName(from: currentLocation, with: "City") { (name) in
            self.title = name
        }
    }
    
    @objc func tableRefresh(_ sender: AnyObject?) {
        self.refresh(from: currentLocation.coordinate)
        self.dailyWeatherTable.refreshControl?.endRefreshing()
    }
    
    func assignDelegates() {
        DispatchQueue.main.async {
            if self.dailyWeatherTable.dataSource == nil && self.dailyWeatherTable.delegate == nil {
                self.dailyWeatherTable.dataSource = self
                self.dailyWeatherTable.delegate = self
            } else {
                self.dailyWeatherTable.reloadData()
            }
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
            detailController.title = self.title
            self.show(detailController, sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

// MARK: - LocationManagerDelegate
extension WeatherMasterController: LocationManagerDelegate {
    func locationDidUpdate(with location: CLLocation) {
        self.currentLocation = location
        self.refresh(from: location.coordinate)
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
        currentLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        self.refresh(from: location)
    }
    
    func dismissedWithCurrentLocation() {
        locationManager.locationManager.requestLocation()
        self.refresh(from: currentLocation.coordinate)
    }
}




