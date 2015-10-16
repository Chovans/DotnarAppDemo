//
//  OrderViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/25.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var waitButton: UIButton!
    @IBOutlet weak var waitDeliverButton: UIButton!
    @IBOutlet weak var waitReceverButton: UIButton!
    @IBOutlet weak var waitEvaluateButton: UIButton!
    
    @IBOutlet weak var buttonBottomView: UIView!
    
    var animationView = UIView()
    
    let data1 = [("滴滴送酒官方旗舰店","等待买家付款","g1","海盗庄主","888.00","1","去付款"),("滴滴送酒官方旗舰店","等待买家付款","g2","性感庄主","1888.00","2","去付款")]
    let data2 = [("滴滴送酒官方旗舰店","等待卖家发货","g1","海盗庄主","888.00","1","提醒发货"),("滴滴送酒官方旗舰店","等待卖家发货","g3","性感庄主","1888.00","2","提醒发货")]
    let data3 = [("滴滴送酒官方旗舰店","等待买家确认","g1","海盗庄主","888.00","1","确认收货")]
    let data4 = [("滴滴送酒官方旗舰店","未评价","g1","海盗庄主","888.00","1","去评价")]
    
//    var data = [("","","","","","","")]
    var data = [(String,String,String,String,String,String,String)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero

        
        setButtonColor(allButton)
        buttonAction(allButton)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView = UIView(frame: CGRect(x: 15, y: 0, width: allButton.bounds.width - 15, height: 2))
        animationView.backgroundColor = UIColor(r: 74, g: 144, b: 226, a: 1)
        buttonBottomView.addSubview(animationView)
        
    }
    @IBAction func buttonAction(sender: UIButton) {
        clearButtonColor()
        setButtonColor(sender)
        
        UIView.animateWithDuration(0.3, delay: 0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
            self.animationView.frame = CGRect(x: sender.frame.origin.x + 15, y: 0, width: sender.frame.width - 30, height: 2)
            }, completion: nil)
        let title = sender.titleForState(UIControlState.Normal)!
        if title.isEqual("全部"){
            data.appendContentsOf(data1)
            data.appendContentsOf(data2)
            data.appendContentsOf(data3)
            data.appendContentsOf(data4)
        }else if title.isEqual("待付款"){
            data.appendContentsOf(data1)
        }else if title.isEqual("待发货") {
            data.appendContentsOf(data2)
        }else if title.isEqual("待收货"){
            data.appendContentsOf(data3)
        }else if title.isEqual("待评价"){
            data.appendContentsOf(data4)
        }else {
            data.removeAll()
        }
        
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector:Selector("reloadTableViewData:"), userInfo: nil, repeats: false)
    }
    @IBAction func goodsButtonAction(sender: UIButton) {
        let title = sender.titleForState(UIControlState.Normal)!
        if title.isEqual("去付款"){
            let payPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("payPage")
            presentViewController(payPage, animated: true, completion: nil)
        }
    }
    
    func reloadTableViewData(sender:AnyObject){
        tableView.reloadData()
    }
    
    func setButtonColor(button:UIButton){
        button.setTitleColor(UIColor(r: 74, g: 144, b: 226, a: 1), forState: .Normal)
    }
    func clearButtonColor(){
        allButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        waitButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        waitDeliverButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        waitReceverButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        waitEvaluateButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        D3Notice.showText("加载数据中",time:0.3,autoClear:true)
        
        data.removeAll()
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        
        let d = data[indexPath.row]
        
        let shopName = cell.viewWithTag(1) as! UILabel
        shopName.text = d.0
        
        let state = cell.viewWithTag(2) as! UILabel
        state.text = d.1
        
        let image = cell.viewWithTag(3) as! UIImageView
        image.image = UIImage(named: d.2)
        image.userInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("go2Detail:")))
        
        let goodsName = cell.viewWithTag(4) as! UILabel
        goodsName.text = d.3
        
        let price = cell.viewWithTag(5) as! UILabel
        price.text = "￥\(d.4)"
        
        let num = cell.viewWithTag(6) as! UILabel
        num.text = "x\(d.5)"
        
        
        let button = cell.viewWithTag(7) as! UIButton
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(r: 74, g: 144, b: 226, a: 1).CGColor
        button.setTitle(d.6, forState: UIControlState.Normal)
        
        return cell
    }
    
    func go2Detail(sender:AnyObject){
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("goodsDetail")
        presentViewController(detailViewController, animated: true) { () -> Void in
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    @IBAction func back(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
