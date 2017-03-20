//
//  APIClient+URL.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/20/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation
import CoreLocation

func constructAPIURL(from location: CLLocation) -> String {
    let baseURL = "https://api.darksky.net/forecast/"
    let latitude = location.coordinate.latitude
    let longtitude = location.coordinate.longitude
    return "\(baseURL)\(API_KEY)/\(latitude),\(longtitude)"
}
