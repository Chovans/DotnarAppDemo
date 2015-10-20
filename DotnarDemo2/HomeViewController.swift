//
//  ViewController.swift
//  DotnarDemo2
//
//  Created by chovans on 15/9/22.
//  Copyright © 2015年 dotnar. All rights reserved.
//

import UIKit

struct MenuItem {
    var backgroundImageName = ""
    var menuName = ""
    var red = 0
    var green = 0
    var blue = 0
    
    init(){
        
    }
    
    init(backgroundImageName:String,menuName:String,red:Int,green:Int,blue:Int){
        self.backgroundImageName = backgroundImageName
        self.menuName = menuName
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    func initData() -> [MenuItem]{
        
        var items = [MenuItem]()
        items.append(MenuItem(backgroundImageName: "price_tag.png", menuName: "聚优惠",red:249,green:131,blue:134))
        items.append(MenuItem(backgroundImageName: "timezone.png", menuName: "本地特供",red:155,green:84,blue:47))
        items.append(MenuItem(backgroundImageName: "dropbox.png", menuName: "金融服务",red:244,green:116,blue:25))
        items.append(MenuItem(backgroundImageName: "gold_bars.png", menuName: "积分",red:249,green:152,blue:42))
        items.append(MenuItem(backgroundImageName: "dinner.png", menuName: "美食",red:247,green:177,blue:82))
        items.append(MenuItem(backgroundImageName: "floods.png", menuName: "会所",red:29,green:216,blue:169))
        items.append(MenuItem(backgroundImageName: "ticket.png", menuName: "商家",red:143,green:201,blue:28))
        items.append(MenuItem(backgroundImageName: "more.png", menuName: "更多",red:82,green:221,blue:142))
        //        items.append(MenuItem(backgroundImageName: "box.png", menuName: "良品盒子",red:114,green:106,blue:250))
        //        items.append(MenuItem(backgroundImageName: "running.png", menuName: "聚生活",red:72,green:130,blue:251))
        
        
        return items
    }
}

extension UIColor{
    convenience init(r: Int, g:Int , b:Int , a: Double) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: CGFloat(a))
    }
}

class HomeViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var Carousel: UIScrollView!
    @IBOutlet weak var mainImageControl: UIPageControl!
    @IBOutlet weak var menuItemCollection: UICollectionView!
    @IBOutlet weak var fontCai: UILabel!
    @IBOutlet weak var bannerTitle: UIView!
    @IBOutlet weak var bannerLiftPoint: UIView!
    @IBOutlet weak var bannerRightPoint: UIView!
    @IBOutlet weak var homeLifeView: HomeLifeView!
    
    var menuitems = MenuItem().initData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("nextImage:"), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let x = 0
        let y = 10
        mainImageControl.numberOfPages = 4
        mainImageControl.frame = CGRect(origin: CGPoint(x: x, y: y), size: mainImageControl.frame.size)
        
        let imageWidth = Carousel.bounds.width
        //宽高比3：1
        let imageHeight = UIScreen.mainScreen().bounds.width / 3
        
        for idx in 0...3{
            let image = UIImage(named: "MainPicture\(idx + 1)")
            let imageView = UIImageView(image: image)
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.frame = CGRectMake(imageWidth * CGFloat(idx), 0, imageWidth, imageHeight)
            /*  根据父级窗口改变大小？  calls sizeThatFits: with current view bounds and changes bounds size  */
            imageView.sizeToFit()
            Carousel.addSubview(imageView)
        }
        
        Carousel.contentSize = CGSize(width: imageWidth * 4, height: imageHeight)
        Carousel.showsHorizontalScrollIndicator = false
        Carousel.showsVerticalScrollIndicator = false
        Carousel.userInteractionEnabled = true
        Carousel.pagingEnabled = true
        Carousel.delegate = self
        
        
        
        menuItemCollection.delegate = self
        menuItemCollection.dataSource = self
        menuItemCollection.backgroundColor = UIColor.whiteColor()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func nextImage(sender:AnyObject){
        var page = mainImageControl.currentPage + 1
        
        if page == 4{
            page = 0
        }
        
        mainImageControl.currentPage = page
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.Carousel.contentOffset = CGPoint(x: CGFloat(page) * self.Carousel.bounds.width, y: 0)
            }, completion: nil)
        
    }
    
    //MARK : LifeView
    
    func initLifeView(){
        homeLifeView.images.removeAll()
        for idx in 1...21{
            let image =  UIImage(named: "g\(idx).jpeg");
            let imageView = UIImageView(image:image)
            let tapGuesture = UITapGestureRecognizer(target: self, action: Selector("go2GoodsDetail:"))
            
            imageView.addGestureRecognizer(tapGuesture)
            imageView.userInteractionEnabled = true
            homeLifeView.addImage(imageView)
            
        }
    }
    
    func go2GoodsDetail(sender:AnyObject){
        let detailView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("goodsDetail")
        presentViewController(detailView, animated: true, completion: nil)
    }
    
    //MARK : Banner
    
    @IBAction func go2ShopView(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 2
    }
    func initBanner(){
        
        
        bannerTitle.backgroundColor = UIColor.clearColor()
        bannerTitle.layer.borderWidth = 1
        bannerTitle.layer.borderColor = UIColor.whiteColor().CGColor
        
        fontCai.textColor = UIColor(r: 66, g: 200, b: 232, a: 1)
        fontCai.layer.cornerRadius = 13
        fontCai.layer.borderWidth = 1
        fontCai.layer.borderColor = UIColor(r: 66, g: 200, b: 232, a: 1).CGColor
        
        bannerLiftPoint.transform = CGAffineTransformMakeScale(1, 1)
        bannerRightPoint.transform = CGAffineTransformMakeScale(1, 1)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        initLifeView()
        initBanner()
        
        let rate = (UIScreen.mainScreen().bounds.width - bannerTitle.bounds.width) / bannerLiftPoint.bounds.width
        let color = UIColor(r:72,g:130,b:251,a:1)
        
        bannerTitle.alpha = 0.0
        
        UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.bannerLiftPoint.transform = CGAffineTransformMakeScale(rate, 1)
            self.bannerRightPoint.transform = CGAffineTransformMakeScale(rate, 1)
            self.bannerLiftPoint.backgroundColor = color
            self.bannerRightPoint.backgroundColor = color
            }) {(finish) -> Void in
         UIView.animateWithDuration(0.7, animations: { () -> Void in
            self.bannerTitle.alpha = 1.0
            self.bannerLiftPoint.backgroundColor = UIColor.whiteColor()
            self.bannerRightPoint.backgroundColor = UIColor.whiteColor()
            self.bannerLiftPoint.transform = CGAffineTransformMakeScale(rate, 0.5)
            self.bannerRightPoint.transform = CGAffineTransformMakeScale(rate, 0.5)
         })
        }
    }
    
    
    //MARK : CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = menuItemCollection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MenuItemCollectionViewCell
        let data = menuitems[indexPath.row]
        
        cell.label.text = menuitems[indexPath.row].menuName
        cell.imageView.image = UIImage(named: data.backgroundImageName)
        
        let r = (cell.frame.width - 16 ) / 2
        let rate = 1 / ( sqrt( r * r / 2 ) * 2 / cell.imageView.frame.width )
        cell.imageView.transform = CGAffineTransformMakeScale(rate,rate)
        
        cell._view.layer.cornerRadius = r
        cell._view.layer.borderWidth = 1
        
        cell._view.layer.borderColor = UIColor(r: data.red, g: data.green, b: data.blue, a: 1).CGColor
        cell._view.layer.masksToBounds = true
        
        //跳转
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7 {
            let tapGuesture = UITapGestureRecognizer(target: self, action: Selector("go2Shop:"))
            cell.addGestureRecognizer(tapGuesture)
        }else if indexPath.row == 3 {
            let tapGuesture = UITapGestureRecognizer(target: self, action: Selector("go2User:"))
            cell.addGestureRecognizer(tapGuesture)
        }else if indexPath.row == 6 {
            let tapGuesture = UITapGestureRecognizer(target: self, action: Selector("go2Baidu:"))
            cell.addGestureRecognizer(tapGuesture)
        }
        
        return cell
    }
    
    func go2Baidu(sender:AnyObject){
//        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.dotnar.com/")!)
        let businessControl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("businessWebView")
        presentViewController(businessControl, animated: true, completion: nil)
    }
    
    func go2Shop(sender:AnyObject){
        tabBarController?.selectedIndex = 1
    }
    
    func go2User(sender:AnyObject){
        tabBarController?.selectedIndex = 3
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let width = (UIScreen.mainScreen().bounds.width - 60) / 4.5
        return CGSize(width:width, height: width * 6 / 5)
    }
    
    var _view = UIView()
    var _imageView = UIImageView()
    @IBAction func qrAction(sender: UIButton) {
        _view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: view.bounds.height))
        _view.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.8)
        _imageView = UIImageView(image: UIImage(named: "recode1"))
        _imageView.frame = CGRect(x: view.frame.width / 4, y:view.frame.height / 4, width: 0, height: view.frame.width / 2)
        _imageView.contentMode = UIViewContentMode.ScaleToFill
        _view.addSubview(_imageView)
        
        view.addSubview(_view)
        
        _view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("clear:")))
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self._view.frame = self.view.frame
            self._imageView.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 4, width: self.view.frame.width / 2, height: self.view.frame.width / 2)
            }) { (finish) -> Void in
        }
    }
    
    func clear(sender:AnyObject){
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 6, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self._view.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
            self._imageView.frame = CGRect(x: 0, y: self._imageView.frame.origin.y, width: 0, height: self._imageView.bounds.height)
            }) { (finish) -> Void in
                self._view.removeFromSuperview()
        }
    }
}

