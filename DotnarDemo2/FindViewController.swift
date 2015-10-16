//
//  FindViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/24.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class FindViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let data = [("旧意咖啡馆（One Day）","精品黑咖啡8.8折（88%现金+12%现金券）","咖啡酒吧     深圳","0.76km"),
        ("四个老朋友","同时享受网络团购套餐价格，其他90%现金+10%现金券","深圳","4.16km"),
        ("YOLO啤酒店","易盟商圈会员到店消费享受95%现金+5%现金券","深圳","9.46km"),
        ("诚信佳贸易","全单80%现金+20%现金券，欢迎到店消费","商场百货     深圳","11.86km"),
        ("宝福汽车服务中心","易盟商圈会员优惠请见商户详情！","汽车用品     深圳","11.98km"),
        ("香港国际美容煜莎立","70%现金+30%现金券","美容美体     深圳","12.24km")]

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var areaButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.separatorInset = UIEdgeInsetsZero
        tableview.contentInset = UIEdgeInsetsZero
        
//        tableview.rowHeight = UITableViewAutomaticDimension
//        tableview.estimatedRowHeight = 100
        
        areaButton.layer.cornerRadius = 5

    }
    let sv = SplitCommon2()
    var currentButton = UIButton()
    @IBAction func showSplitView(sender: UIButton) {
        /*
//        let _view = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 0))
//        _view.backgroundColor = UIColor.redColor()
//        view.addSubview(_view)
        splitCommon.view.removeFromSuperview()
        
        splitCommon = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("splitCommon")
        splitCommon.view.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 0)
        splitCommon.view.layer.borderWidth = 1
        splitCommon.view.clipsToBounds = true
//        splitCommon.view.layoutIfNeeded()
        splitCommon.view.translatesAutoresizingMaskIntoConstraints = true
        
        
        view.addSubview(splitCommon.view)
        addChildViewController(splitCommon)
*/
        currentButton = sender
        sv.view.removeFromSuperview()
        sv.removeFromParentViewController()
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let image = cell.viewWithTag(1) as! UIImageView
        let title = cell.viewWithTag(2) as! UILabel
        let detail = cell.viewWithTag(3) as! UILabel
        let type = cell.viewWithTag(4) as! UILabel
        let distance = cell.viewWithTag(5) as! UILabel
        
        image.image = UIImage(named: "g\(indexPath.row + 1)")
        title.text = data[indexPath.row].0
        detail.text = data[indexPath.row].1
        type.text = data[indexPath.row].2
        distance.text = data[indexPath.row].3
        
        return cell
    }
    
    func getCity(city:String){
        sv.view.removeFromSuperview()
        sv.removeFromParentViewController()
        areaButton.setTitle(city, forState: UIControlState.Normal)
    }
    
    func getResult(result:String) {
        currentButton.setTitle(result, forState: UIControlState.Normal)
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UIScreen.mainScreen().bounds.width * 5 / 12 + 50
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
