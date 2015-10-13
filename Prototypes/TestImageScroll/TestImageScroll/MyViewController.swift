//
//  ViewController.swift
//  TestImageScroll
//
//  Created by Jay Lubo on 9/29/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    var secondViewController: UIViewController!
    var mainStoryboard: UIStoryboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        secondViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SecondViewController")
        //scrollView .addSubview(imageView)

        
        //scrollView.contentSize = imageView.image!.size
        //scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 300.0)
        //scrollView.contentOffset = CGPointMake(50.0, 50.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
            //self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
}

extension MyViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (velocity.y < 0) {
            presentViewController(secondViewController, animated: true, completion:nil)
        }
    }
}
