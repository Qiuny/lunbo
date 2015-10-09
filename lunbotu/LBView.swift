//
//  LBView.swift
//  lunbotu
//
//  Created by Joggy on 15/10/9.
//  Copyright © 2015年 Apple. All rights reserved.
//

import Foundation
import UIKit

class LBView: UIView, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var lunboImage = [UIImage]()
    var numOfImage: Int = 0

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.scrollView = UIScrollView(frame: frame)
        self.addSubview(scrollView)
        pageControl = UIPageControl()
        self.addSubview(pageControl)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scroll() {
        numOfImage = lunboImage.count
        let leftimage = lunboImage.last
        lunboImage.insert(leftimage!, atIndex: 0)
        let rightimage = lunboImage[1]
        lunboImage.append(rightimage)
        pageControl.layer.position = CGPointMake(scrollView.frame.width/2, scrollView.frame.height - 20 + scrollView.frame.origin.y)
        pageControl.numberOfPages = numOfImage
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        pageControl.addTarget(self, action: "turnPage", forControlEvents: UIControlEvents.TouchUpInside)
        scrollView.contentSize = CGSizeMake(self.frame.width*CGFloat(numOfImage+2), self.frame.height)
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        scrollInit()
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "autoScroll", userInfo: nil, repeats: true)
    }
    
    func scrollInit() {
        let width = self.frame.width
        let height = self.frame.height
        for i in 0...self.lunboImage.count-1 {
            let scrollImageView = UIImageView(frame: CGRectMake(CGFloat(i)*width, 0, width, height))
            scrollImageView.image = lunboImage[i]
            scrollView.addSubview(scrollImageView)
        }
        let rect = CGRectMake(width, 0, width, height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
    func autoScroll() {
        let num = self.numOfImage
        var page = pageControl.currentPage
        page++
        if page >= num {
            scrollView.scrollRectToVisible(CGRectMake(CGFloat(num+1)*scrollView.frame.width, 0, scrollView.frame.width, scrollView.frame.height), animated: true)
            let minseconds = 0.3*Double(NSEC_PER_SEC)
            let dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minseconds))
            dispatch_after(dtime, dispatch_get_main_queue(), {
                self.scrollView.scrollRectToVisible(CGRectMake(self.scrollView.frame.width, 0, self.scrollView.frame.width, self.scrollView.frame.height), animated: false)
            })
            
            page = 0
            pageControl.currentPage = page
        }
        else {
            pageControl.currentPage = page
            turnPage()
        }
    }
    
    func turnPage() {
        let page = CGFloat(pageControl.currentPage)
        scrollView.scrollRectToVisible(CGRectMake((page + 1)*scrollView.frame.width, 0, scrollView.frame.width, scrollView.frame.height), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let a = self.scrollView.contentOffset.x
        let w = self.frame.width
        let h = self.frame.height
        let page: Int = Int(a/w)
        if page == 0 {
            self.scrollView.scrollRectToVisible(CGRect(x: w*CGFloat(self.numOfImage), y: 0, width: w, height: h), animated: false)
        }
        else if page == self.numOfImage+1 {
            self.scrollView.scrollRectToVisible(CGRect(x: w, y: 0, width: w, height: h), animated: false)
        }
        let pag = self.scrollView.contentOffset.x/w
        self.pageControl.currentPage = Int(pag - 1)
    }
    
}