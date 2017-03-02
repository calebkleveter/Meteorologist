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
        
        let blue = UIColor(red: 18/255, green: 7/255, blue: 161/255, alpha: 1)
        let green = UIColor(red: 0/255, green: 212/255, blue: 42/255, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [green.cgColor, blue.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
