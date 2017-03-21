//
//  LocationPickerController.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/21/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit
import MapKit

class LocationPickerController: UIViewController {

    var pickerView: LocationPickerView? = nil
    
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
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}
