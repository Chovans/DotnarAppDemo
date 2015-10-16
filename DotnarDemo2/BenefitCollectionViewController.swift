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
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

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
        
//        let goodsNum = Int(arc4random_uniform(7)) + 1
        let randomMath = Float(arc4random_uniform(10))
        let randomPrice = Float(arc4random_uniform(100))
        
        //设置图片
        let picture = cell.viewWithTag(1) as! UIImageView
        picture.image = UIImage(named: "g\(indexPath.row + 1)")
        
        //设置商品名称
        let name = cell.viewWithTag(2) as! UILabel
        name.text = "滴滴送酒促销商品（促销 \(indexPath.row + 1)）"
        
        //设置抢购进度条
        let progress = cell.viewWithTag(3) as! UIProgressView
        progress.progress = Float(randomMath / 10)
        
        //设置促销价
        let newPrice = cell.viewWithTag(4) as! UILabel
        newPrice.text = "\(randomPrice)元"
        
        //设置原价（比例）
        let oldPrice = cell.viewWithTag(5) as! UILabel
        oldPrice.text = "\(randomMath * randomPrice)元"
        let attributer = NSAttributedString(string: oldPrice.text!, attributes: [NSStrikethroughStyleAttributeName:1])
        oldPrice.attributedText = attributer
        
        //设置按钮layer样式
        let buyButton = cell.viewWithTag(6) as! UIButton
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = UIColor.orangeColor().CGColor
        buyButton.layer.cornerRadius = 3
        
        //添加手势 -> 跳转到商品详情页
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("go2Detail:"))
        picture.addGestureRecognizer(tapGesture)
        
        return cell
    }
    
    //重新设置单元格大小
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let width = (UIScreen.mainScreen().bounds.width - 30) / 2
        let height = (width - 16) * 3 / 2 + 80
        
        return CGSize(width:width, height: height)
    }

    //跳转至商品详情页
    func go2Detail(sender:AnyObject){
        let detailView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("goodsDetail")
//        view.superview?.addSubview(detailView.view)
        self.presentViewController(detailView, animated: true, completion: nil)
    }
    
    @IBAction func testClick(sender: UIButton) {
        
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
