//
//  LogoImageView.swift
//  CALayerProSwift
//
//  Created by Andrew Belozerov on 13.04.16.
//  Copyright © 2016 Andrew Iron. All rights reserved.
//

import UIKit

@IBDesignable class LogoView: UIView {
    
    let imageView = UIImageView()
    
@IBInspectable var image: UIImage? {
        didSet {
            addImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup () {
        imageView.frame = CGRectMake(0, 0, 240, 240)
        imageView.contentMode = .ScaleAspectFit
        addSubview(imageView)
        
        // Граница вокруг картинки
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 4.0
        
        // Углы
        //imageView.layer.cornerRadius = 30.0
        imageView.layer.cornerRadius = CGRectGetHeight(imageView.bounds) / 2
      
        // Поправим отображения слоя за его границами
        imageView.layer.masksToBounds = true
        
        // Если не установить последнее свойстов, то картинка будет все рвно квадратная, хотя граница нарисуется кргуглой. Т.е. мы установили, что содержимое слоя будет ограничено маской, которая в данном случае является окружностью, созданной закругленными краями.
        //
    }
    
    
    func addImage() {
        imageView.image = image
    }
}
