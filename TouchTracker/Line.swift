//
//  Line.swift
//  TouchTracker
//
//  Created by Savannah Stoughton on 4/10/19.
//  Copyright © 2019 Savannah Stoughton. All rights reserved.
//

//import Foundation
import CoreGraphics
import UIKit


struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
}
    
extension Line {
    var angle: Measurement<UnitAngle> {
        guard begin != end else {
            return Measurement(value: 0.0, unit: .radians)
        }
        let dy = Double(end.y - begin.y)
        let dx = Double(end.x - begin.x)
        let angleRadian: Measurement<UnitAngle> = Measurement(value: atan2(dy, dx), unit: .radians)
        return angleRadian
    }
        
    var color: UIColor {
        let colors = [UIColor.blue, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.red, UIColor.yellow]
        let ratio = (self.angle.value + Double.pi) / (Double.pi * 2)   // First map angle in 0 ..< 2*Pi
        let index = Int( Double(colors.count - 1) * ratio)
        return colors[index]
}
}
