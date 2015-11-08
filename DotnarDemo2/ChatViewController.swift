//
//  ChatViewController.swift
//  易盟商圈
//
//  Created by chovans on 15/11/5.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let refreshContorl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.tableFooterView = UIView()
        
        refreshContorl.addTarget(self, action: Selector("refresh:"), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshContorl)
        
    }
    
    func refresh(sender:AnyObject){
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("stopRefresh:"), userInfo: nil, repeats: false)
    }
    func stopRefresh(sender:AnyObject){
        refreshContorl.endRefreshing()
    }

    
    @IBAction func messageListAction(sender: UIButton) {
        
    }
    @IBOutlet weak var friendListAction: UIButton!
    
    @IBAction func addButtonAction(sender: UIButton) {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func backAction(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
