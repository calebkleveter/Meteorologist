//
//  DailyWeatherCell.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/6/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class DailyWeatherCell: UITableViewCell {

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.textColor = .white
        label.backgroundColor = .clear
        // FIXME: - This is a placeholder
        label.text = "Sept 23"
        return label
    }()
    
    lazy var iconLabel: UILabel = {
        let label = UILabel()
        WeatherIcon.set(label, textTo: .unSupported, with: 40)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureLayout()
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        self.addSubview(dateLabel)
        self.addSubview(iconLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 20),
                dateLabel.widthAnchor.constraint(equalToConstant: 110),
                dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                
                iconLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                iconLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
}
