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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let size = CGRectMake(0, 100, self.view.frame.width, self.view.frame.height/3)
        lb = LBView(frame: size)
        for i in 0...4 {
            let imStr = String(format: "bg%i", i)
            let image = UIImage(named: imStr)!
            lb.lunboImageView.append(UIImageView(image: image))
        }
        lb.scroll()
        self.view.addSubview(lb)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

