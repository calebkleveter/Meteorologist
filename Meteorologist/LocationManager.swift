//
//  LocationManager.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/20/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate: class {
    func locationDidUpdate(with location: CLLocation)
}

class LocationManager: NSObject {
    let locationManager = CLLocationManager()
    var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.locationManager.requestLocation()
    }
    
    func getUserPermission() {
        if CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .denied {
            locationManager.requestWhenInUseAuthorization()
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
        if let location = locations.first {
            self.delegate?.locationDidUpdate(with: location)
            print(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
