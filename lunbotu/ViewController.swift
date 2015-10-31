//
//  ViewController.swift
//  lunbotu
//
//  Created by Joggy on 15/10/9.
//  Copyright © 2015年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lb: LBView!
    
    var images = [UIImage]()
    let str = ["http://7xlyw8.com1.z0.glb.clouddn.com/shiwu/footbal-ball.png", "http://7xlyw8.com1.z0.glb.clouddn.com/shiwu/localImage1.jpg", "http://7xlyw8.com1.z0.glb.clouddn.com/shiwu/owl.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let size = CGRectMake(0, 64, self.view.frame.width, self.view.frame.height/3)
        lb = LBView(frame: size)
//        for i in 0...2 {
//            let imStr = String(format: "bg%i", i)
//            images.append(UIImage(named: imStr)!)
//        }
        lb.scrollImagesByNet(str, placeHolderImage: UIImage(named: "bg5")!)
        lb.backgroundColor = UIColor.greenColor()
        lb.scroll()
        self.view.addSubview(lb)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

