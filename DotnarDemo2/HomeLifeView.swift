//
//  HomeLifeView.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/23.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class HomeLifeView: UIView {
    var images = [UIImageView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.whiteColor()
    }
    
    func addImage(image:UIImageView){
        let width = UIScreen.mainScreen().bounds.width / 3
        var height = 0
        if images.count >= 3{
            height = Int(width) * Int(images.count / 3)
        }
        image.frame = CGRectMake(CGFloat(images.count % 3) * CGFloat(width), CGFloat(height), CGFloat(width), CGFloat(width))
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.whiteColor().CGColor
        images.append(image)
        addSubview(image)
    }
    
}
