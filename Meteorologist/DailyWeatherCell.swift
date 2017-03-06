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
        label.text = "Oct 23"
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

}
