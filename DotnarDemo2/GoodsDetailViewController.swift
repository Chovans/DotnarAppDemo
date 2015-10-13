//
//  GoodsDetailViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/10/6.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

class GoodsDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIWebViewDelegate,UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var detailBarUnderLabel: UILabel!
    @IBOutlet weak var detailWebView: UIWebView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailWebView.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        scrollView.delegate = self
        
        //商品详情 下划线 用label模拟
        detailBarUnderLabel.layer.borderColor = UIColor(r: 222, g: 222, b: 222, a: 1).CGColor
        detailBarUnderLabel.layer.borderWidth = 1
        
        //添加店铺、收藏按钮效果
        let borderColor = UIColor(r: 233, g: 233, b: 233, a: 1).CGColor
        shopButton.layer.borderColor = borderColor
        shopButton.layer.borderWidth = 0.5
        favorButton.layer.borderWidth = 0.5
        favorButton.layer.borderColor = borderColor
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        detailWebView.loadHTMLString(content, baseURL: nil)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        var frame = detailWebView.frame
        var otherHeight:CGFloat = 0.0
        otherHeight += UIScreen.mainScreen().bounds.width / 1.1
        otherHeight += collectionView.bounds.height
        otherHeight += 60
        otherHeight += 60
        
        let height = Int(detailWebView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"content\").offsetHeight")!)!
        let width = Int(detailWebView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"content\").offsetWidth")!)!
        
        frame.size.height = CGFloat(CGFloat(height) / (CGFloat(width) / UIScreen.mainScreen().bounds.width))
        detailWebView.frame = frame
        
        scrollView.contentSize = CGSize(width: Int(scrollView.bounds.width), height:Int(detailWebView.bounds.height + otherHeight))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : Buy Process
    //店铺按钮事件
    @IBAction func shopAction(sender: UIButton) {
        let controller = UIAlertController(title: "提示", message: "暂未开放", preferredStyle: UIAlertControllerStyle.Alert)
        controller.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { _ -> Void in}))
        presentViewController(controller, animated: true, completion: nil)
    }
    //收藏按钮事件
    @IBAction func favorAction(sender: UIButton) {
        let controller = UIAlertController(title: "收藏", message: "已经成功添加收藏", preferredStyle: UIAlertControllerStyle.Alert)
        controller.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { _ -> Void in}))
        presentViewController(controller, animated: true, completion: nil)
    }
    //添加到购物车事件
    @IBAction func addShopCartAction(sender: UIButton) {
        showNoticeText("已经成功加入购物车",time:1,autoClear:true)
    }
    //现在购买事件
    @IBAction func buyNowAction(sender: UIButton) {
        
    }
    
    //MARK : CollectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: "gd\(indexPath.row + 1)")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        let size = CGSize(width: collectionView.bounds.height - 10, height: collectionView.bounds.height - 10)
        return size
    }
    
    // MARK: - Back Button Action
    @IBAction func backAction(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    let content = "<div id='content' style='text-align:center;'><p><img src='http://7jpte7.com1.z0.glb.clouddn.com/FtpXixUqMKSDvRJrhVrW6Bh_Jj54' width='886' height='666'></p><p><br></p><p><strong><span style='font-size: 18px;'>酒评：这款金狮子梅洛红葡萄酒</span></strong></p><p><span style='font-family: 微软雅黑, 'Microsoft YaHei';'><span style='font-size: 18px;'>如美丽的宝石红色，性感妩媚。烟熏味、雪松味、黑莓味、黑樱桃味、甜椒味、橡木烤香味交相释放。入口柔顺平滑，酒体中等至饱满。丰富、浓郁与奢华的烟熏味和黑色浆果味在口中相互交融。单宁适中，回味绵长。是一款性感优雅的酒，一如酒标上的梦露，</span>迷离的眼神带有些许挑逗，引人入胜；而优雅的庄容，<span style='font-size: 18px;'>却又显得高贵。适合在</span><span style='font-size: 18px;'>16-18℃</span><span style='font-size: 18px;'>饮用。如女人一般温柔。</span></span></p><p><span style='font-size: 18px; font-family: 微软雅黑, 'Microsoft YaHei';'>使您感受到幸福其实如此简单</span></p><p><br></p><p><br></p><p><br></p><p><img src='http://7jpte7.com1.z0.glb.clouddn.com/Fpj2XMW1gwRYze8PoC92jLUx3Y4G'></p><p><img src='http://7jpte7.com1.z0.glb.clouddn.com/Fh9E4YU4OnjB9MRSK9dp0lCu49NA'></p><p><img src='http://7jpte7.com1.z0.glb.clouddn.com/FtxtjkUe9xpQyeZB0xwGrzt3eAOS' width='860' height='1352'></p><p><img src='http://7jpte7.com1.z0.glb.clouddn.com/FpRQhzUpKYfgA7u-3doKHs1N_lqS'></p><p><br></p><section><section><section><section><section><section><section><section><span style='color: rgb(255, 0, 0); font-size: 18px; background-color: rgb(255, 255, 255);'><strong>庄主特权</strong></span></section></section></section></section><br></section></section></section></section><p><strong>购买庄主系列任意产品（性感庄主，海盗庄主，醉庄主），即可获赠庄主俱乐部会籍资格，开启庄主俱乐部的惊喜旅程：</strong></p><p><br></p><p><br></p><p><br></p><section><section><section><section><section><span style='background-color: rgb(242, 220, 219);'>1、<span style='color: inherit; font-family: inherit; font-size: 14px; line-height: 1.6em;'>归属一个圈层</span></span></section></section></section></section></section><p><br></p><p>庄主俱乐部是一个圈层，是红酒的爱好者，是懂得享受的生活家。庄主们以红酒为媒介，分享红酒世界的无尽魅力，分享一种庄主式的诗意生活。</p><p>在庄主俱乐部，每一位庄主的加入，都如同归属一个大家庭。大家志趣相投，彼此建立信任，共同合作，创造无尽财富。</p><p><br></p><p><br></p><p><br></p><section><section><section><section><section><span style='background-color: rgb(242, 220, 219);'>2、<span style='color: inherit; font-family: inherit; font-size: 14px; line-height: 1.6em;'>拥有一个平台</span></span></section></section></section></section></section><p><br></p><p>庄主俱乐部是一个高端人脉聚集地，全国俱乐部成员的贵宾资源组成强大联盟，成为一个金融社交平台。</p><p>通过全国俱乐部成员的贵宾资源，每一位庄主都可以轻松获得丰富的线下服务资源：包括定制明星派对、游艇出海、高尔夫、高端会所<span style='font-family: 宋体; font-size: 14px;'>VIP</span>会员资格</p><p><br></p><p><br></p><p><br></p><section><section><section><section><section><span style='background-color: rgb(242, 220, 219);'>3、<span style='color: inherit; font-family: inherit; font-size: 14px; line-height: 1.6em;'>加入一种生态商业模式</span></span></section></section></section></section></section><p><br></p><p>成为庄主，即可享受产品分销奖励特权，</p><p>每推荐一位朋友加入庄主俱乐部，</p><p>您将获得<span style='font-family: 宋体; font-size: 14px;'>200</span>元至<span style='font-family: 宋体; font-size: 14px;'>20</span>万元不等的现金回馈，</p><p>您还将有机会踏上溯源法国葡萄酒文化的庄主之旅，</p><p><span style='color: rgb(255, 0, 0);'>开启一种庄主式的私享生活。</span></p><img src='http://7jpte7.com1.z0.glb.clouddn.com/Fg73vqgaRmit9UD77PhWEirLF5G0' width='885' height='2053'></div>"

}
