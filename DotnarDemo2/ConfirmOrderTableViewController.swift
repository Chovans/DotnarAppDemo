//
//  ConfirmOrderTableViewController.swift
//  庄主商圈
//
//  Created by chovans on 15/10/9.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class ConfirmOrderTableViewController: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var GoodsNumberStepper: UIStepper!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var goodsPrice: UILabel!
    @IBOutlet weak var messsageTextField: UITextField!
    @IBOutlet weak var addressButton: UIButton!
    
    let igoodsPrice = 999.00
    override func viewDidLoad() {
        super.viewDidLoad()
        messsageTextField.delegate = self
        
        goodsPrice.text = "￥\(igoodsPrice)"

        GoodsNumberStepper.value = 1
        GoodsNumberStepper.minimumValue = 1
        GoodsNumberStepper.maximumValue = 10
        GoodsNumberStepper.addTarget(self, action: Selector("goodsNumberChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
        //地址管理按钮样式
        addressButton.layer.cornerRadius = 5
        
        tableView.tableFooterView = UIView()
    }
    
    func goodsNumberChange(sender:AnyObject){
        numberLabel.text = Int(GoodsNumberStepper.value).description
        goodsPrice.text = "￥\(igoodsPrice * GoodsNumberStepper.value)"
        
        let pvc = parentViewController as! ConfirmOrderViewController
        pvc.total = igoodsPrice * GoodsNumberStepper.value
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        messsageTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
         messsageTextField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
