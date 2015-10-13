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
    @IBOutlet weak var areaButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.separatorInset = UIEdgeInsetsZero
        tableview.contentInset = UIEdgeInsetsZero
        
//        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 100
        
        areaButton.layer.cornerRadius = 5

    }
    var splitCommon = UIViewController()
    @IBAction func showSplitView(sender: UIButton) {
//        let _view = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 0))
//        _view.backgroundColor = UIColor.redColor()
//        view.addSubview(_view)
        splitCommon.view.removeFromSuperview()
        
        splitCommon = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("splitCommon")
        splitCommon.view.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 0)
        splitCommon.view.layer.borderWidth = 1
        splitCommon.view.clipsToBounds = true
        
        view.addSubview(splitCommon.view)
        addChildViewController(splitCommon)
        
        UIView.animateWithDuration(1) { () -> Void in
            self.splitCommon.view.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height / 2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
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
