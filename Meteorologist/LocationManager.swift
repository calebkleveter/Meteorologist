//
//  LocationManager.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/20/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func getUserPermission() {
        if CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .denied {
            locationManager.requestAlwaysAuthorization()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
}
