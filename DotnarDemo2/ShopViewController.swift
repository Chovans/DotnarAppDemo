//
//  ShopViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/25.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    var navigation = UINavigationController()
    
    @IBOutlet weak var tab1Button: UIButton!
    @IBOutlet weak var tab2Button: UIButton!
    @IBOutlet weak var tab3Button: UIButton!
    @IBOutlet weak var tab4Button: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    let selectColor = UIColor(r:72,g:130,b:251,a:1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tabButtonLayer()
        selectTabBarAction(tab1Button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tabButtonLayer(){
        tabButtonDefaultStyle()
        tab1Button.backgroundColor = selectColor
        tab1Button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
    }
    
    func tabButtonDefaultStyle(){
        let buttons = [tab1Button,tab2Button,tab3Button,tab4Button]
        
        buttons.forEach { (button) -> () in
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(r: 240, g: 240, b: 240, a: 1).CGColor
            button.backgroundColor = UIColor.whiteColor()
            button.setTitleColor(selectColor, forState: UIControlState.Normal)
        }
        
    }
    
    // MARK : Selcet Item
    var barTitle:String = ""
    
    @IBAction func selectTabBarAction(sender: UIButton) {
        
        //重置按钮颜色
        tabButtonDefaultStyle()
        //修改点击按钮的样式
        sender.backgroundColor = selectColor
        sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        barTitle = sender.titleForState(.Normal)!
        
        contentView.subviews.forEach { (sb) -> () in
            sb.removeFromSuperview()
        }
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activity.startAnimating()
        activity.hidesWhenStopped = true
        activity.frame.origin = CGPoint(x: (UIScreen.mainScreen().bounds.width - 20 ) / 2, y: (contentView.bounds.height - 20) / 2)
        contentView.addSubview(activity)
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "showDetail:", userInfo: nil, repeats: false)
       
    }
    
    func showDetail(sender:AnyObject){
        
        var _thisView = UIViewController()
        
        contentView.subviews.forEach { (sb) -> () in
            sb.removeFromSuperview()
        }
        
        switch barTitle{
        case "聚优惠":_thisView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("benefit"); break
        case "聚生活":_thisView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("benefit"); break
        case "生活服务":_thisView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("benefit"); break
        case "本地正品":_thisView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("benefit"); break
        default:_thisView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("benefit")
        }
        
        addChildViewController(_thisView)
        contentView.addSubview(_thisView.view)
    }

}
