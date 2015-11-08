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
    @IBOutlet weak var menuBackView: UIView!
    //选中时颜色
    let selectColor = UIColor(r:72,g:130,b:251,a:1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBackView.layer.borderWidth = 1
        menuBackView.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 0.8).CGColor
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //设置segmented样式
        tabButtonLayer()
        //选中segument操作 -> 切换内容
        selectTabBarAction(tab1Button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tabButtonLayer(){
        //重置默认（默认不选择时的样式）
        tabButtonDefaultStyle()
        //设置选择的样式
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
        
        //延时动画，模拟网络加载
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "showDetail:", userInfo: nil, repeats: false)
       
    }
    
    let sv = SplitCommon2()
    
    var currentButton = UIButton()
    @IBAction func menuAction(sender: UIButton) {
        sv.view.removeFromSuperview()
        sv.removeFromParentViewController()
        currentButton = sender
        
        if sender.titleForState(UIControlState.Normal) == "全城" {
            sv.getMenuType("city.json")
        }else{
            sv.getMenuType("classification.json")
        }
        
        sv.view.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 0)
        sv.view.clipsToBounds = true
        sv.view.alpha = 0.0
        
        view.addSubview(sv.view)
        addChildViewController(sv)
        
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.sv.view.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height)
            self.sv.view.alpha = 1.0
        }

    }
    
    func getCity(city:String){
        sv.view.removeFromSuperview()
        sv.removeFromParentViewController()
//        areaButton.setTitle(city, forState: UIControlState.Normal)
    }
    
    func getResult(result:String) {
        currentButton.setTitle(result, forState: UIControlState.Normal)
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
