//
//  ViewController.swift
//  lunbotu
//
//  Created by Joggy on 15/10/9.
//  Copyright © 2015年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kwidth = UIScreen.mainScreen().bounds.width
    let kheight = UIScreen.mainScreen().bounds.height
    
    var images = [UIImage]()
    let str = ["http://7xlyw8.com1.z0.glb.clouddn.com/shiwu/footbal-ball.png", "http://7xlyw8.com1.z0.glb.clouddn.com/shiwu/localImage1.jpg", "http://7xlyw8.com1.z0.glb.clouddn.com/shiwu/owl.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        let size = CGRectMake(0, 240, self.view.frame.width, self.view.frame.height/3)
        let lb = LBView(frame: CGRectMake(0, 0, kwidth, kheight/3))
        lb.scrollImagesByNet(str, placeHolderImage: UIImage(named: "bg5")!)
//        lb.backgroundColor = UIColor.redColor()
        lb.scroll()
        let v = UIView(frame: size)
        v.backgroundColor = UIColor.purpleColor()
        v.addSubview(lb)
        self.view.addSubview(v)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

