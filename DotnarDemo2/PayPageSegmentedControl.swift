//
//  PayPageSegmentedControl.swift
//  易盟商圈
//
//  Created by chovans on 15/10/10.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class PayButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame:CGRect,image:UIImage){
        super.init(frame: frame)
        setBackgroundImage(image, forState: UIControlState.Normal)
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor.init(r: 222, g: 222, b: 222, a: 1).CGColor
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

class PayPageSegmentedControl: UIViewController {
    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var scrollInsetView: UIView!
    
    override func viewDidLoad() {
        segmented.selectedSegmentIndex = 0
        scrollView.canCancelContentTouches = true
    }
    
    @IBAction func segmentSelect(sender: UISegmentedControl) {
        
        var offset = CGPoint()
        
        if segmented.selectedSegmentIndex == 1{
            offset = CGPoint(x: scrollView.bounds.width, y: CGFloat(0))
        }else if segmented.selectedSegmentIndex == 2{
            offset = CGPoint(x: scrollView.bounds.width * 2, y: CGFloat(0))
        }else {
            offset = CGPoint(x: 0, y: CGFloat(0))
        }
        
        UIView.animateWithDuration(0.2, delay: 0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
            self.scrollView.contentOffset = offset
            }, completion: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let eachWidth = scrollView.bounds.width
        
        scrollView.contentSize = CGSize(width: eachWidth * 3, height: scrollView.bounds.height)
//        scrollInsetView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.bounds.height)
//        scrollInsetView.backgroundColor = UIColor.redColor()
//        print(scrollInsetView.bounds.width)
        
        for idx in 0...3{
            let v = UIView(frame: CGRect(x: CGFloat(idx) * eachWidth, y: 0, width: eachWidth, height: scrollView.bounds.height))
            initUI(idx, _view: v)
            v.layer.borderWidth = 1
            v.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 0.4).CGColor
            scrollView.addSubview(v)
        }
        
    }
    
    //初始化界面
    func initUI(indexView:Int,_view:UIView){
        let width = scrollView.bounds.width
        let buttonSize = CGSize(width:  (width - 60) / 2, height: (width - 60) / 4)
        
        if indexView == 0 {
            let alipay = PayButton(frame: CGRect(origin: CGPoint(x: 20, y: 20), size: buttonSize),image: UIImage(named: "alipay.png")!)
            alipay.tag = 1
            alipay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("showSelectState:")))
            _view.addSubview(alipay)
            
            let wxpay = PayButton(frame: CGRect(origin: CGPoint(x: 40 + buttonSize.width, y: 20), size: buttonSize),image: UIImage(named: "wxpay.png")!)
            wxpay.tag = 2
            wxpay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("showSelectState:")))
            _view.addSubview(wxpay)
            
        }else if indexView == 1 {
            let icbc = PayButton(frame: CGRect(origin: CGPoint(x: 20, y: 20), size: buttonSize),image: UIImage(named: "icbc.png")!)
            icbc.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("showSelectState:")))
            _view.addSubview(icbc)
            
            let abc = PayButton(frame: CGRect(origin: CGPoint(x: 40 + buttonSize.width, y: 20), size: buttonSize),image: UIImage(named: "abc.png")!)
            abc.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("showSelectState:")))
            _view.addSubview(abc)
            
            let boc = PayButton(frame: CGRect(origin: CGPoint(x: 20, y: 40 + buttonSize.height), size: buttonSize),image: UIImage(named: "boc.png")!)
            boc.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("showSelectState:")))
            _view.addSubview(boc)
            
            let ccb = PayButton(frame: CGRect(origin: CGPoint(x: 40 + buttonSize.width, y: 40 + buttonSize.height), size: buttonSize),image: UIImage(named: "ccb.png")!)
            ccb.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("showSelectState:")))
            _view.addSubview(ccb)
        }else if indexView == 2 {
            
            let balance = UIButton(type: UIButtonType.System)
            balance.frame = CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: width / 2, height: width / 6))
            balance.setTitle("可用金额：10,000", forState: UIControlState.Normal)
            balance.layer.borderWidth = 1
            balance.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 1).CGColor
            balance.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            let tapGesture = UITapGestureRecognizer(target: self, action: Selector("showSelectState:"))
            balance.addGestureRecognizer(tapGesture)
            
            _view.addSubview(balance)
        }
    }
    
    var selectPayWay = 0;
    
    func showSelectState(tapGesture:UITapGestureRecognizer){
        let buttonView = tapGesture.view!
        for v in (buttonView.superview?.subviews)!{
            if v.isKindOfClass(UIButton){
                v.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 1).CGColor
                v.layer.borderWidth = 1
            }
        }
        buttonView.layer.borderColor = UIColor(r: 9, g: 125, b: 223, a: 0.8).CGColor
        buttonView.layer.borderWidth = 2
        
        if buttonView.tag != 0 {
            selectPayWay = buttonView.tag
        }
    }
    
    @IBAction func surePay(sender: UIButton) {
        if selectPayWay == 0 {
            showNoticeErr("请选择支付方式！")
        }
        else{
            showNoticeSuc("支付成功！")
            //清除堆栈
            var vcRoot = self.presentingViewController
            while((vcRoot?.presentingViewController) != nil){
                vcRoot = vcRoot?.presentingViewController
            }
            vcRoot?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func canclePay(sender: UIButton) {
        showNoticeErr("取消支付！")
        dismissViewControllerAnimated(false, completion: nil)
    }
    func buildButton(button:UIButton){
        button.layer.borderColor = UIColor.blueColor().CGColor
    }

    @IBAction func backAction(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
