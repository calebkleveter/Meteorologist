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
    var onLocationUpdate: ((CLLocation) -> Void)?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    func getUserPermission() {
        if CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .denied {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func getLocationName(from location: CLLocation, with placemarkString: String, endingWith completion: @escaping (String) -> ()) {
        let coder = CLGeocoder()
        
        coder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemarks = placemarks else { completion("N/A"); return }
            if let placemark = placemarks.first {
                if let locationName = (placemark.addressDictionary as? [String: AnyObject])?[placemarkString] as? String {
                    completion(locationName)
                    return
                } else { completion("N/A"); return }
            } else { completion("N/A"); return }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first,
            let onLocationUpdate = onLocationUpdate {
                onLocationUpdate(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
