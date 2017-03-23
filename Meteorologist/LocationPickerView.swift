//
//  LocationPickerView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/21/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit
import MapKit

protocol LocationPickerViewDelegate: class {
    func useCurrentLocation()
    func useSelectedLocation()
}

class LocationPickerView: UIView {
    
    var delegate: LocationPickerViewDelegate?
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        return map
    }()
    
    lazy var searchBar: UISearchBar = {
        return UISearchBar()
    }()
    
    lazy var selectLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle("Use Selected Location", for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(LocationPickerView.selectedLocationButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var useCurrentLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle("Use Current Location", for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(LocationPickerView.currentLocationButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(GradientView(frame: frame))
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectedLocationButtonAction(_ sender: AnyObject?) {
        self.delegate?.useSelectedLocation()
    }
    
    func currentLocationButtonAction(_ sender: AnyObject?) {
        self.delegate?.useCurrentLocation()
    }
    
    func configureLayout() {
        self.addSubview(mapView)
        self.addSubview(useCurrentLocationButton)
        self.addSubview(selectLocationButton)
        self.addSubview(searchBar)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        selectLocationButton.translatesAutoresizingMaskIntoConstraints = false
        useCurrentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                NSLayoutConstraint(item: mapView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: mapView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
                mapView.heightAnchor.constraint(equalToConstant: 300),
                
                NSLayoutConstraint(item: searchBar, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: searchBar, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1.0, constant: 0),
            
                NSLayoutConstraint(item: selectLocationButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: selectLocationButton, attribute: .top, relatedBy: .equal, toItem: searchBar, attribute: .bottom, multiplier: 1.0, constant: 0),
                selectLocationButton.heightAnchor.constraint(equalToConstant: 100),
                selectLocationButton.widthAnchor.constraint(equalToConstant: (self.frame.size.width / 2) - 0.5),
                
                NSLayoutConstraint(item: useCurrentLocationButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: useCurrentLocationButton, attribute: .top, relatedBy: .equal, toItem: searchBar, attribute: .bottom, multiplier: 1.0, constant: 0),
                useCurrentLocationButton.heightAnchor.constraint(equalToConstant: 100),
                useCurrentLocationButton.widthAnchor.constraint(equalToConstant: (self.frame.size.width / 2) - 0.5),
            ])
    }
}
