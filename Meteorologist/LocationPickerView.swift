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
    
    lazy var searchBar: UISearchBar = {
        return UISearchBar()
    }()
    
    lazy var locationSearchResultsTable: UITableView = {
        let tableView = UITableView()
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        return tableView
    }()
    
    lazy var selectLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        button.setTitle("Use Selected Location", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    lazy var useCurrentLocationButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        button.setTitle("Use Current Location", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    func configureLayout() {
        self.addSubview(mapView)
        self.addSubview(useCurrentLocationButton)
        self.addSubview(selectLocationButton)
        self.addSubview(searchBar)
        self.addSubview(locationSearchResultsTable)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        locationSearchResultsTable.translatesAutoresizingMaskIntoConstraints = false
        selectLocationButton.translatesAutoresizingMaskIntoConstraints = false
        useCurrentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                NSLayoutConstraint(item: mapView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: mapView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
                mapView.heightAnchor.constraint(equalToConstant: 200),
                
                NSLayoutConstraint(item: searchBar, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: searchBar, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1.0, constant: 0),
                
                NSLayoutConstraint(item: locationSearchResultsTable, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: locationSearchResultsTable, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: locationSearchResultsTable, attribute: .top, relatedBy: .equal, toItem: searchBar, attribute: .bottom, multiplier: 1.0, constant: 0),
                locationSearchResultsTable.heightAnchor.constraint(equalToConstant: 200 - searchBar.frame.size.height - 40),
                
                NSLayoutConstraint(item: selectLocationButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: selectLocationButton, attribute: .top, relatedBy: .equal, toItem: locationSearchResultsTable, attribute: .bottom, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: selectLocationButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
                selectLocationButton.widthAnchor.constraint(equalToConstant: self.frame.size.width / 2),
                
                NSLayoutConstraint(item: useCurrentLocationButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: useCurrentLocationButton, attribute: .top, relatedBy: .equal, toItem: locationSearchResultsTable, attribute: .bottom, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: useCurrentLocationButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
                useCurrentLocationButton.widthAnchor.constraint(equalToConstant: self.frame.size.width / 2),
            ])
    }
}
