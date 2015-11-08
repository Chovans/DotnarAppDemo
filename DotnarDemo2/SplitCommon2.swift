//
//  SplitCommon2.swift
//  易盟商圈
//
//  Created by chovans on 15/10/14.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit
import SwiftyJSON

class SplitCommon2: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var leftTableView = UITableView()
    var rightTableView = UITableView()
    
    var leftData = [String]()
    var rightData = [String]()
    var province = ""
    var json = JSON("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.mainScreen().bounds.width
        let shadow = UIView(frame: CGRect(x: 0, y: width, width: width, height: view.bounds.height - width))
        shadow.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.5)
        shadow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("hidden:")))
        view.addSubview(shadow)
        
        leftTableView.frame = CGRect(x: 0, y: 0, width: width / 3, height: width)
        rightTableView.frame = CGRect(x: width / 3 , y: 0, width: width / 3 * 2 , height: width)
        
        setTableView(leftTableView)
        setTableView(rightTableView)
        
    }
    
    func getMenuType(fileName:String){
        
        do{
            let jsonData = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)!
            let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: jsonData), options: NSDataReadingOptions.DataReadingMappedIfSafe)
            
            json = JSON(data: data)
            leftData.removeAll()
            rightData.removeAll()
            for idx in 0...json.array!.count{
                leftData += [json[idx]["name"].stringValue]
            }
            leftTableView.reloadData()
            rightTableView.reloadData()
        }catch{
            print("error")
        }
        
    }
    
    func hidden(tap:AnyObject){
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.view.frame = CGRect(x: 0, y: 100, width: UIScreen.mainScreen().bounds.width, height: 0)
            self.view.alpha = 0.1
            }) { (finish) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        }
        
        
    }
    
    func setTableView(tableView:UITableView){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //设定cell和label大小、样式
        let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: label.font.fontName, size: 11)
        
        //如果是左边一个tableView
        if tableView.isEqual(leftTableView) {
            //cell 基本样式
            cell.backgroundColor = UIColor(r: 244, g: 244, b: 244, a: 1)
            if leftData.count > 0 && indexPath.row < leftData.count{
                label.text = "\(leftData[indexPath.row])"
            }
            //cell 选中时样式
            let bgView = UIView(frame: cell.frame)
            bgView.backgroundColor = UIColor.whiteColor()
            cell.selectedBackgroundView = bgView
            
        }
            //如果是右边一个tableView
        else {
            if rightData.count > 0 && indexPath.row < rightData.count{
                label.text = "\(rightData[indexPath.row])"
            }
        }
        
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        cell.addSubview(label)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(leftTableView) {
            return leftData.count
        }
        return rightData.count
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if tableView.isEqual(leftTableView) {
            
            province = leftData[indexPath.row]
            rightData.removeAll()
            for idx in 0...json.array!.count{
                if province == json[idx]["name"].stringValue {
                    for city in 0...json[idx]["sub"].array!.count {
                        rightData += [json[idx]["sub"][city]["name"].stringValue]
                    }
                }
            }
            rightTableView.reloadData()
            
            
            
        }else{
            hidden(self)
            let city = rightData[indexPath.row]
//            let fvc = parentViewController as! FindViewController
            let fvc = parentViewController as! ShopViewController
            if leftData.count > 30 {
                if city == "全部" {
                    fvc.getCity(province)
                }else{
                    fvc.getCity(city)
                }
            }
            fvc.getResult(city)
        }
        return indexPath
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
