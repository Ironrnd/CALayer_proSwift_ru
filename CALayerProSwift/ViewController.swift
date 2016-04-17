//
//  ViewController.swift
//  CALayerProSwift
//
//  Created by Andrew Belozerov on 13.04.16.
//  Copyright © 2016 Andrew Iron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: BlueView!
    
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var logoView: LogoView!
  
    
    
    var shadowSwitch = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Закругленные углы
        orangeButton.layer.cornerRadius = CGRectGetHeight(orangeButton.bounds) / 2
        
        // Тень
        orangeButton.layer.shadowRadius = 4.0
        orangeButton.layer.shadowOpacity = 0.6
        orangeButton.layer.shadowOffset = CGSize.zero
        
    }
    
    @IBAction func orangeButtonTapped(sender: UIButton) {
        if shadowSwitch {
            orangeButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        } else {
            orangeButton.layer.shadowOffset = CGSize.zero
        }
        shadowSwitch = !shadowSwitch
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

