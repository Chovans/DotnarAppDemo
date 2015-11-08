//
//  ChatOtherViewController.swift
//  易盟商圈
//
//  Created by chovans on 15/11/6.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit


class ChatOtherViewController: NIMSessionViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func infoByUser(userId: String!) -> NIMKitInfo! {
        print(userId)
        let info = NIMKitInfo()
        info.avatarUrlString = "ss"
        return info
    }
    
    func infoByTeam(teamId: String!) -> NIMKitInfo! {
        print(teamId)
        let info = NIMKitInfo()
        info.avatarUrlString = "ss"
        return info
    }
    
    let sessionDataSource = NIMSessionMsgDatasource()
    let sessionViewLayout = NIMSessionViewLayoutManager()
    
    
    override func sendMessage(message: NIMMessage!) {
        /*
        let userRequest = NIMUserRequest()
        userRequest.userId = "test1"
        userRequest.message = "添加好友测试，test1"
        userRequest.operation = NIMUserOperation.Request
        
        NIMSDK.sharedSDK().userManager.requestFriend(userRequest) { (error) -> Void in
            if error != nil {
                print("添加好友出错\(error)")
            }else{
                print("发送请求成功")
            }
        }
        */
        
        
        
        
        let session = NIMSession("test1",type:NIMSessionType.P2P)
        do{
            try NIMSDK.sharedSDK().chatManager.sendMessage(message, toSession: session)
        }catch let e {
            print("发送出错\(e)")
        }
        
        let insert = self.sessionDataSource.addMessages([message])
        let model = NIMMessageModel(message: message)
        sessionViewLayout.insertTableViewCellAtRows([insert])
        
    }
    
    /*  NSArray *insert = [self.sessionDatasource addMessages:messages];
    for (NIMMessage *message in messages) {
    NIMMessageModel *model = [[NIMMessageModel alloc] initWithMessage:message];
    [self layoutConfig:model];
    }
    [self.layoutManager insertTableViewCellAtRows:insert];
    */
    
    override func uiUpdateMessage(message: NIMMessage!) {
        super.uiUpdateMessage(message)
        print("更新信息")
    }
    
    
    override func sessionConfig() -> NIMSessionConfig! {
        return MySessionConfig()
    }
    
    override func onTapMediaItem(item: NIMMediaItem!) {
        if item.tag == 0 {
            /*
            let camera = UIImagePickerController()
            camera.delegate = self
            camera.allowsEditing = true
            camera.sourceType = .Camera
            presentViewController(camera, animated: true, completion: nil)
            */
        }else if item.tag == 1 {
            let photo = UIImagePickerController()
            photo.sourceType = .PhotoLibrary
            photo.delegate = self
            presentViewController(photo, animated: true, completion: nil)

        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}