//
//  UserViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/23.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var headImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headImageView.layer.borderColor = UIColor.whiteColor().CGColor
        headImageView.layer.borderWidth = 2
        headImageView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        return cell;
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
