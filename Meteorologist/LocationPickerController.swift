//
//  LocationPickerController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/21/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit
import MapKit

protocol LocationPickerContollerDelegate: class {
    func dismissedWith(location: CLLocationCoordinate2D)
    func dismissedWithCurrentLocation()
}

class LocationPickerController: UIViewController {

    var pickerView: LocationPickerView? = nil
    var newLocation: CLLocationCoordinate2D?
    var delegate: LocationPickerContollerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = LocationPickerView(frame: self.view.frame)
        self.view.addSubview(pickerView!)
        self.pickerView?.delegate = self
        self.pickerView?.mapView.delegate = self
        self.pickerView?.searchBar.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

extension LocationPickerController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        var mapRegion = MKCoordinateRegion()
        mapRegion.center = mapView.userLocation.coordinate
        mapRegion.span.latitudeDelta = 0.25
        mapRegion.span.longitudeDelta = 0.25
        
        mapView.setRegion(mapRegion, animated: true)
    }
}

extension LocationPickerController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response, let pickerView = self.pickerView else { print("Bad Location"); return }
            
            if pickerView.mapView.annotations.count > 0 {
                pickerView.mapView.removeAnnotations(pickerView.mapView.annotations)
            }
            
            self.newLocation = response.boundingRegion.center
            
            var mapRegion = MKCoordinateRegion()
            mapRegion.center = response.boundingRegion.center
            mapRegion.span.latitudeDelta = 0.25
            mapRegion.span.longitudeDelta = 0.25
            
            let locationAnnotation = MKPointAnnotation()
            locationAnnotation.title = searchBar.text
            locationAnnotation.coordinate = response.boundingRegion.center
            
            pickerView.mapView.addAnnotation(locationAnnotation)
            pickerView.mapView.setRegion(mapRegion, animated: true)
        }
    }
}

extension LocationPickerController: LocationPickerViewDelegate {
    func useSelectedLocation() {
        if let location = newLocation {
            self.delegate?.dismissedWith(location: location)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func useCurrentLocation() {
        self.delegate?.dismissedWithCurrentLocation()
        self.dismiss(animated: true, completion: nil)
    }
}















