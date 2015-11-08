//
//  AddNewArticleViewController.swift
//  易盟商圈
//
//  Created by chovans on 15/10/21.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class AddNewArticleViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTextView.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 0.8).CGColor
        detailTextView.layer.cornerRadius = 3
        
        titleTextField.delegate = self
        detailTextView.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        titleTextField.resignFirstResponder()
        detailTextView.resignFirstResponder()
    }
    
    @IBAction func backAction(sender: UIButton) {
        showNoticeErr("取消发布！")
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("back:"), userInfo: nil, repeats: false)
    }

    @IBAction func eleaseAction(sender: UIButton) {
        if (titleTextField.text?.isEmpty != nil) && (detailTextView.text?.isEmpty != nil){
            showNoticeErr("请填写完整!")
        }else{
            showNoticeSuc("发布成功！等待审核！")
            NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("back:"), userInfo: nil, repeats: false)
        }
    }
    
    func back(sender:AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectImagesAction(sender: UIButton) {
        let pickerController = DKImagePickerController()
        pickerController.sourceType = .Photo
        pickerController.didCancel = { () in
//            print("didCancel")
        }
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            
            for idx in 0...(assets.count-1) {
                if let img = assets[idx].thumbnailImage {
                    self.images.append(img)
                }
                
            }
            self.reloadImage()
        }
        
        self.presentViewController(pickerController, animated: true) {}
    }
    
    func reloadImage(){
        
        let size = CGSize(width: imageScrollView.bounds.height - 4, height: imageScrollView.bounds.height - 2)
        
        imageScrollView.subviews.forEach { (img) -> () in
            img.removeFromSuperview()
        }
        if(images.count>1){
            for idx in 0...images.count-1 {
                let point = CGPoint(x: CGFloat(idx % 3) * size.height + 1.0, y: CGFloat(Int(idx / 3)) * size.height + 1)
                let img = UIImageView(frame: CGRect(origin: point, size: size))
                img.userInteractionEnabled = true
                img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("removeImage:")))
                img.image = self.images[idx]
                img.frame = CGRect(origin: point, size: size)
                imageScrollView.addSubview(img)
            }
            
            imageScrollView.contentSize = CGSize(width: imageScrollView.bounds.width, height: CGFloat(ceil( Double(images.count) / 3 )) * imageScrollView.bounds.height)
            
            imageScrollView.userInteractionEnabled = true
            imageScrollView.bounces = true
        }
        
    }
    
    func removeImage(sender:UITapGestureRecognizer){
        let view = sender.view as! UIImageView
        images.forEach { (image) -> () in
            if image.isEqual(view.image){
                images.removeAtIndex(images.indexOf(image)!)
            }
        }
        reloadImage()
    }

}
