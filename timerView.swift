//
//  timerView.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/12/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//
import QuartzCore
import UIKit

@IBDesignable

class timerView: UIView {
    
    var backgroundLayer: CAShapeLayer!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !backgroundLayer{
            backgroundLayer = CAShapeLayer()
            backgroundLayer.fillColor = UIColor.blackColor().CGColor
            backgroundLayer.frame = layer.bounds

            layer.addSublayer(backgroundLayer)
        }
    }

}
