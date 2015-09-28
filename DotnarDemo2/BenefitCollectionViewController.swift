//
//  BenefitCollectionViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/26.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class BenefitCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.whiteColor()
//        collectionView?.delegate = self
//        collectionView?.dataSource = self
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 1).CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 2
        
        let randomMath = Float(arc4random_uniform(10))
        let randomPrice = Float(arc4random_uniform(1000))
        
        let progress = cell.viewWithTag(3) as! UIProgressView
        progress.progress = Float(randomMath / 10)
        
        let newPrice = cell.viewWithTag(4) as! UILabel
        newPrice.text = "\(randomPrice)元"
        
        let oldPrice = cell.viewWithTag(5) as! UILabel
        oldPrice.text = "\(randomMath * randomPrice)元"
        let attributer = NSAttributedString(string: oldPrice.text!, attributes: [NSStrikethroughStyleAttributeName:1])
        oldPrice.attributedText = attributer
        
        let buyButton = cell.viewWithTag(6) as! UIButton
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = UIColor.orangeColor().CGColor
        buyButton.layer.cornerRadius = 3
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let width = (UIScreen.mainScreen().bounds.width - 30) / 2
        let height = (width - 16) * 3 / 2 + 80
        return CGSize(width:width, height: height)
    }

    @IBAction func testClick(sender: UIButton) {
        print("test")
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
