//
//  WeatherTableView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 2/27/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class WeatherTableView: UIView {
    lazy var tempHighIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .up, with: 36)
        return label
    }()
}
