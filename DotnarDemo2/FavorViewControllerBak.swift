//
//  FavorViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/10/6.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class FavorViewControllerBak: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var data = [("g1","海盗庄主","999.00"),("g2","性感庄主","999.00"),("g3","迷你庄主","999.00"),("g4","音乐家·圣母之乳","1000.00")]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func editAction(sender: UIBarButtonItem) {

        if !tableView.editing {
            tableView.setEditing(true, animated: true)
        }else{
            tableView.setEditing(false, animated: true)
        }
    }
    
    // MARK: tableView edit part
    //询问每个cell是否都能编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row == 0{
            return false
        }
        return true
    }
    //询问cell的编辑模式（删除，添加），默认删除
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    //点击删除或者添加按钮的时候触发的事件，可以在此编辑事件内容
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.data.removeAtIndex(indexPath.row)
        tableView.reloadData()
//        UIView.animateWithDuration(0.3, animations: { () -> Void in
//            cell?.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 0)
//            }) { (finish) -> Void in
//                self.data.removeAtIndex(indexPath.row)
//                tableView.reloadData()
//        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let d = data[indexPath.row]
        
        let image = cell.viewWithTag(1) as! UIImageView
        image.image = UIImage(named: d.0)
        
        let title = cell.viewWithTag(2) as! UILabel
        title.text = d.1
        
        let price = cell.viewWithTag(3) as! UILabel
        price.text = "￥\(d.2)"
        
        let button = cell.viewWithTag(4) as! UIButton
        button.layer.borderWidth = 1
        button.layer.borderColor = themeColor.CGColor
        button.layer.cornerRadius = 3
        
        return cell
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
