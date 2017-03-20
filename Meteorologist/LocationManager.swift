//
//  LocationManager.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/20/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
    let locationManager = CLLocationManager()
    
    func getUserPermission() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
