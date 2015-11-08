//
//  FindViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/24.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class FindViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    /*
    let data = [("旧意咖啡馆（One Day）","精品黑咖啡8.8折（88%现金+12%现金券）","咖啡酒吧     深圳","0.76km"),
        ("四个老朋友","同时享受网络团购套餐价格，其他90%现金+10%现金券","深圳","4.16km"),
        ("YOLO啤酒店","易盟商圈会员到店消费享受95%现金+5%现金券","深圳","9.46km"),
        ("诚信佳贸易","全单80%现金+20%现金券，欢迎到店消费","商场百货     深圳","11.86km"),
        ("宝福汽车服务中心","易盟商圈会员优惠请见商户详情！","汽车用品     深圳","11.98km"),
        ("香港国际美容煜莎立","70%现金+30%现金券","美容美体     深圳","12.24km")]*/
    
    let data = [("load1","奇葩买家秀","被点了一万次以上","刘海戴的也是醉了","这奇葩买家给狗带23333333333笑死我了","g13","g14","g15","1分钟前","809","12"),
    ("load2","爱爬虫","被点了两万次以上","这条蟒好大","新闻上看到的！！","g13","","","18分钟前","4809","35"),
    ("load3","新手妈妈","被点了十万次以上","宝宝老是喷奶，我该肿么办","我一个人在家，这是我的第一个孩子，完全没经验...","g13","g14","g15","1小时前","4209","40"),
    ("load4","去啊！旅行","被点了十万次以上","单身的我，拉着闺蜜跑去马尔代夫","26岁依然单身的我，心血来潮...","g13","g14","g15","2小时前","79341","152")]
    
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var type1Button: UIButton!
    @IBOutlet weak var type2Button: UIButton!
    @IBOutlet weak var type3Button: UIButton!
    @IBOutlet weak var type4Button: UIButton!
    @IBOutlet weak var type5Button: UIButton!
    @IBOutlet weak var typeBottomView: UIView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* tableView 设置 */
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .None
        tableView.tableFooterView = UIView()
        
        //用户头像
//        userPhoto.layer.cornerRadius = 15
        
    }
    
    var bottomView = UIView()
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //typeButton bottom
        bottomView.frame = CGRect(x: 0, y: 0, width: type1Button.frame.width, height: 2)
        bottomView.backgroundColor = themeColor
        typeBottomView.addSubview(bottomView)
        
        //scrollview
        let width = scrollView.bounds.width
        let height = scrollView.bounds.height
        for idx in 0...2{
            let image = UIImageView(image: UIImage(named: "MainPicture\(idx + 2)"))
            image.frame = CGRect(x: CGFloat(idx) * width, y: 0, width: width, height: height)
            scrollView.addSubview(image)
        }
        scrollView.contentSize = CGSize(width: width * 3, height: 0)
    }
    @IBAction func typeSelectAction(sender: UIButton) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.bottomView.frame = CGRect(x: sender.frame.origin.x, y: 0, width: sender.frame.width, height: 2)
            }) { (finish) -> Void in
                
        }
    }
    
    //动态改变cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let width = (UIScreen.mainScreen().bounds.width - 32) / 3
        return 166 + width
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        /* TableViewCell Footer */
        let footerView = UIView(frame: CGRect(x: 0, y: cell.bounds.height - 10, width: UIScreen.mainScreen().bounds.width, height: 10))
        footerView.backgroundColor = UIColor(r: 233, g: 233, b: 233, a: 1)
        let line = UIView(frame: CGRect(x: 0, y: 0, width: footerView.bounds.width, height: 1))
        line.backgroundColor = UIColor(r: 200, g: 200, b: 200, a: 1)
        footerView.addSubview(line)
        cell.addSubview(footerView)
        
        /* Each Element */
        let d = data[indexPath.row]
        
        let userPhoto = cell.viewWithTag(1) as! UIImageView
        userPhoto.image = UIImage(named: d.0)
        
        let userName = cell.viewWithTag(2) as! UILabel
        userName.text = d.1
        
        let state = cell.viewWithTag(3) as! UILabel
        state.layer.cornerRadius = 3
        state.layer.backgroundColor = UIColor(r: 74, g: 144, b: 226, a: 1).CGColor
        state.text = d.2
        
        let title =  cell.viewWithTag(4) as! UILabel
        title.text = d.3
        
        let detail = cell.viewWithTag(5) as! UILabel
        detail.text = d.4
        
        let img1 = cell.viewWithTag(6) as! UIImageView
        if d.5 != "" {
            img1.image = UIImage(named: d.5)
        }
        
        let img2 = cell.viewWithTag(7) as! UIImageView
        if d.6 != "" {
            img2.image = UIImage(named: d.6)
        }
        
        let img3 = cell.viewWithTag(8) as! UIImageView
        if d.7 != "" {
            img3.image = UIImage(named: d.7)
        }
        
        let time = cell.viewWithTag(9) as! UILabel
        time.text = d.8
        
        let see = cell.viewWithTag(10) as! UILabel
        see.text = d.9
        
        let comment = cell.viewWithTag(11) as! UILabel
        comment.text = d.10
        
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
