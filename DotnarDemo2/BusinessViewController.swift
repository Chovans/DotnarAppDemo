//
//  BusinessViewController.swift
//  易盟商圈
//
//  Created by chovans on 15/10/16.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var ac: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        let url = NSURL(string: "http://www.dotnar.com/")
        webView.loadRequest(NSURLRequest(URL: url!))
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        ac.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        ac.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
