//
//  FindViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/24.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class FindViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let data = [("MainPicture1.png","head1.png","滴滴送酒——火爆开启！","299","2015-10-10"),
    ("MainPicture1.png","load2.png","滴滴送酒——火爆开启！","299","2015-10-10"),
    ("MainPicture1.png","load3.png","滴滴送酒——火爆开启！","299","2015-10-10"),
    ("MainPicture1.png","load4.png","滴滴送酒——火爆开启！","299","2015-10-10"),
    ("MainPicture1.png","load5.png","滴滴送酒——火爆开启！","299","2015-10-10")]

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.separatorInset = UIEdgeInsetsZero
        tableview.contentInset = UIEdgeInsetsZero
        
//        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 100
//         Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let mainPicture = cell.viewWithTag(1) as! UIImageView
        let headPicture = cell.viewWithTag(2) as! UIImageView
        let title = cell.viewWithTag(3) as! UILabel
        let mon = cell.viewWithTag(4) as! UILabel
        let date = cell.viewWithTag(5) as! UILabel
        
        mainPicture.image = UIImage(named: data[indexPath.row].0)
        headPicture.image = UIImage(named: data[indexPath.row].1)
        title.text = data[indexPath.row].2
        mon.text = data[indexPath.row].3
        date.text = data[indexPath.row].4
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.mainScreen().bounds.width * 5 / 12 + 50
    }
    
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
