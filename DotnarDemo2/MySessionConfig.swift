//
//  MySessionConfig.swift
//  易盟商圈
//
//  Created by chovans on 15/11/6.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class MySessionConfig:NSObject, NIMSessionConfig {
    
    func mediaItems() -> [AnyObject]! {
        let camera = NIMMediaItem()
        camera.tag = 0
        camera.normalImage = UIImage(named: "bk_media_shoot_normal")
        camera.selectedImage = UIImage(named: "bk_media_shoot_pressed")
        camera.title = "相机"
        
        let picture = NIMMediaItem()
        picture.tag = 1
        picture.normalImage = UIImage(named: "bk_media_picture_normal")
        picture.selectedImage = UIImage(named: "bk_media_picture_nomal_pressed")
        picture.title = "图库"
        
        return [camera,picture]
    }

}
