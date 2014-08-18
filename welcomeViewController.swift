//
//  welcomeViewController.swift
//  Carousel
//
//  Created by Sam Jau on 8/18/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class welcomeViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width:1280, height:568)
        scrollView.delegate = self
        backupButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            UIView.animateWithDuration(0.5, animations:{            self.backupButton.alpha = 100
                self.pageControl.alpha = 0
            },completion: nil)
        }
    }
    

}
