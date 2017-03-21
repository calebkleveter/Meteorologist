//
//  LocationPickerView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/21/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit
import MapKit

class LocationPickerView: UIView {
    
    lazy var mapView: MKMapView = {
        return MKMapView()
    }()
    
    lazy var searchController: UISearchController = {
        return UISearchController()
    }()
    
    lazy var selectLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    lazy var useCurrentLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        button.isUserInteractionEnabled = true
        return button
    }()
}
