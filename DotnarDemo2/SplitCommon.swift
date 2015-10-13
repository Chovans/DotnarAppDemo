//
//  SplitCommon.swift
//  易盟商圈
//
//  Created by chovans on 15/10/13.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class SplitCommon: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.dataSource = self
        // Do any additional setup after loading the view.
        view.translatesAutoresizingMaskIntoConstraints = true
        reloadViews()
    }

    func reloadViews(){
        let screenWidth = UIScreen.mainScreen().bounds.width
        leftTableView.frame = CGRect(x: 0, y: 0, width: screenWidth / 3 , height: view.frame.height)
        rightTableView.frame = CGRect(x: screenWidth / 3, y: 0, width: screenWidth / 3 * 2, height: view.frame.height)
        
        view.needsUpdateConstraints()
        view.sizeToFit()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let title = cell.viewWithTag(1) as! UILabel
        title.text = "hahah"
        return cell
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
