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
        imageView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(imageView)
        
        // Граница вокруг картинки
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 4.0
      
        imageView.layer.masksToBounds = true
        // Если не установить последнее свойстов, то картинка будет все рвно квадратная, хотя граница нарисуется кргуглой. Т.е. мы установили, что содержимое слоя будет ограничено маской, которая в данном случае является окружностью, созданной закругленными краями.
 
    }
    
    
    func addImage() {
        imageView.image = image
    }
    
    
    override func layoutSublayersOfLayer(layer: CALayer) {
        // Сделаем картику круглой
        imageView.layer.cornerRadius = CGRectGetHeight(imageView.bounds) / 2
        
        // The reason is because layoutSubviews() is called when the bounds of your view changes, giving you a chance to re-calculate any layout dependent on size.
        // Установка свойств закругления именно в этом методя связано с особенностью жизненного цикла ViewController. Как вы помните, при зменении размеров imageView, если они роисходят при autolayout, нужно изменить и все свойства, которые основаны на размерах этого inageView. А у нас как раз эта ситуация. Закругление катринки происходит с помощьюе расчета высоты imageView.
    }

}
