//
//  UIColor+Ext.swift
//  LanFar
//
//  Created by 陳湞欽 on 2019/7/11.
//  Copyright © 2019 Great & Best Tech. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int){
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
