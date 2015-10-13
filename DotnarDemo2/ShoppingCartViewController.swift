//
//  ShoppingCartViewController.swift
//  易盟商圈
//
//  Created by chovans on 15/10/12.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var allRadioImage: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        buttonStyle(allRadioImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let button = cell.viewWithTag(1) as! UIButton
        buttonStyle(button)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //全选按钮
    @IBAction func selectAllAction(sender: UIButton) {
        var imageName = "checkmark";
        var borderWidth:CGFloat = 0.0
        if (allRadioImage.backgroundImageForState(UIControlState.Normal)?.isEqual(UIImage(named: "checkmark")) != nil) {
            imageName = "checkmark1"
            borderWidth = 1.0
        }
        
        for cell in tableView.visibleCells{
            let button = cell.viewWithTag(1) as! UIButton
            button.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
            button.layer.borderWidth = borderWidth
        }
        allRadioImage.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        allRadioImage.layer.borderWidth = borderWidth
        
        calculate()
    }
    
    func buttonStyle(button:UIButton){
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 1).CGColor
        
        let tapGuestrue = UITapGestureRecognizer(target: self, action: Selector("selectAction:"))
        button.addGestureRecognizer(tapGuestrue)
    }
    
    func selectAction(sender:UITapGestureRecognizer){
        let button = sender.view as! UIButton
        if (button.backgroundImageForState(UIControlState.Normal)?.isEqual(UIImage(named: "checkmark")) != nil){
            button.layer.borderWidth = 1
            button.setBackgroundImage(UIImage(named: "checkmark1"), forState: UIControlState.Normal)
        }else{
            button.setBackgroundImage(UIImage(named: "checkmark"), forState: UIControlState.Normal)
            button.layer.borderWidth = 0
        }
        calculate()
    }
    
    func calculate(){
        var totalPrices = 0.0
        var totalNumbel = 0
        for cell in tableView.visibleCells {
            let button = cell.viewWithTag(1) as! UIButton
            if button.backgroundImageForState(UIControlState.Normal)?.isEqual(UIImage(named: "checkmark")) != nil{
                let priceLabel = cell.viewWithTag(4) as! UILabel
                let price = (priceLabel.text! as NSString).substringFromIndex(1)
                totalPrices += Double(price)!
                totalNumbel++
            }
            
        }
        totalPrice.text = "￥\(totalPrices.description)"
        clearButton.setTitle("结算(\(totalNumbel))", forState: UIControlState.Normal)
    }
    
    
    @IBAction func clearAction(sender: UIButton) {
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
