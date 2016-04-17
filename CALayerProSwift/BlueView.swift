//
//  BlueView.swift
//  CALayerProSwift
//
//  Created by Andrew Belozerov on 13.04.16.
//  Copyright © 2016 Andrew Iron. All rights reserved.
//

import UIKit


@IBDesignable
class BlueView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable var startColor: UIColor = UIColor.blackColor() {
        didSet {
            gradientSetup()
        }
    }

    @IBInspectable var midColor: UIColor = UIColor.blueColor() {
        didSet {
            gradientSetup()
        }
    }

    
    
    @IBInspectable var endColor: UIColor = UIColor.whiteColor() {
        didSet {
            gradientSetup()
        }
    }
    
    
    
    //let startColor = UIColor.whiteColor()
    //let endColor = UIColor.blueColor()
    
    //let midColor = UIColor.grayColor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    
    private func setup() {
        layer.addSublayer(gradientLayer)
        gradientSetup()
        
    }
    
    private func gradientSetup () {
        
        gradientLayer.colors = [startColor.CGColor, midColor.CGColor, endColor.CGColor]
        gradientLayer.startPoint = CGPointMake(0.5, 0.2)
        gradientLayer.endPoint = CGPointMake(0.5, 0.8)

        //gradientLayer.locations = [0, 0.75, 1]
        
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))
    }
    
    
}
