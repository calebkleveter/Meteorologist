//
//  GradientView.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import UIKit

class GradientView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let blue = UIColor(red: 124/255, green: 198/255, blue: 255/255, alpha: 1.0)
        let green = UIColor(red: 170/255, green: 221/255, blue: 119/255, alpha: 1.0)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [green.cgColor, blue.cgColor].reversed()
        gradient.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
