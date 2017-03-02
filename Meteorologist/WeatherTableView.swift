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
    
    lazy var tempHighLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100º"
        return label
    }()
    
    lazy var tempLowIcon: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .down, with: 36)
        return label
    }()
    
    lazy var tempLowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "100º"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        self.addSubview(tempHighIcon)
        self.addSubview(tempHighLabel)
        self.addSubview(tempLowIcon)
        
        tempHighIcon.translatesAutoresizingMaskIntoConstraints = false
        tempHighLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLowIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                NSLayoutConstraint(item: tempHighIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                NSLayoutConstraint(item: tempHighIcon, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 15),
                tempHighIcon.heightAnchor.constraint(equalToConstant: 20),
                tempHighIcon.widthAnchor.constraint(equalToConstant: 14),
                
                NSLayoutConstraint(item: tempHighLabel, attribute: .left, relatedBy: .equal, toItem: tempHighIcon, attribute: .right, multiplier: 1.0, constant: 10),
                NSLayoutConstraint(item: tempHighLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20),
                tempHighLabel.heightAnchor.constraint(equalToConstant: 20),
                tempHighLabel.widthAnchor.constraint(equalToConstant: 50),
                
                NSLayoutConstraint(item: tempLowIcon, attribute: .top, relatedBy: .equal, toItem: tempHighIcon, attribute: .bottom, multiplier: 1.0, constant: 10),
                NSLayoutConstraint(item: tempLowIcon, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 15),
                tempLowIcon.heightAnchor.constraint(equalToConstant: 20),
                tempLowIcon.widthAnchor.constraint(equalToConstant: 14)
            ])
    }
}
