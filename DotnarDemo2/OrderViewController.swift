//
//  OrderViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/25.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
