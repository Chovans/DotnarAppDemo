
//
//  TestViewController.swift
//  庄主商圈
//
//  Created by chovans on 15/10/9.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        testView.frame = CGRect(x: 100, y: 100, width: 100, height: 2)
        UIView.animateWithDuration(1) { () -> Void in
            self.testView.transform = CGAffineTransformMakeTranslation(100, 0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
