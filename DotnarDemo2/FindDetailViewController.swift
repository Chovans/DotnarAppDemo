//
//  FindDetailViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/10/6.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class FindDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var buttomEditView: UIView!
    @IBOutlet weak var scrollInnerView: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("hidden:")))
        
        commentTextField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("showKeyBoard:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("hideKeyBoard:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 1700)
        var frame = tableView.frame
        frame.size = CGSize(width: frame.width, height: 900)
        tableView.frame = frame
    }
    
    func hidden(sender:AnyObject){
        commentTextField.resignFirstResponder()
    }
    
    var keyBoardHeight:CGFloat = 216.0
    func showKeyBoard(sender:NSNotification){
        
        if let keyboardSize = (sender.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            keyBoardHeight = keyboardSize.height
        }
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.buttomEditView.transform = CGAffineTransformMakeTranslation(0, -self.keyBoardHeight)
        })
    }
    
    func hideKeyBoard(sender:NSNotification){
        buttomEditView.transform = CGAffineTransformMakeTranslation(0, 0)
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        hidden("")
        showNoticeSuc("发布成功！")
        commentTextField.text = ""
        return true
    }
    
    
    // MARK: Table View DataSource

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        
        let commentImage = cell.viewWithTag(5) as! UIImageView
        commentImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("setComment:")))
        
        let commentLabel = cell.viewWithTag(6) as! UILabel
        commentLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("setComment:")))
        
        let goodImage = cell.viewWithTag(7) as! UIImageView
        goodImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("setGood:")))
        
        let goodLabel = cell.viewWithTag(8) as! UILabel
        goodLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("setGood:")))
        
        return cell
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //MARK : Tap GestureRecognizer
    
    func setGood(sender:AnyObject){
        showNoticeSuc("成功点赞！")
    }
    
    func setComment(sender:AnyObject){
        showNoticeSuc("成功评论！")
        commentTextField.text = ""
    }
    
    @IBAction func backAction(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
