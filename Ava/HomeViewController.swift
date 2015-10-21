//
//  ViewController.swift
//  Ava
//
//  Created by Jay Lubo on 10/13/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit
import DrawerController

enum PullTransitionState {
    case SlidingDown
    case ThresholdMet
    case ThresholdNotMet
    case Animating
}

class HomeViewController: UIViewController {
    @IBOutlet weak var scrollingContentView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var secondView: UIViewController!
    var currentState: PullTransitionState = .ThresholdNotMet
    override func viewDidLoad() {

        super.viewDidLoad()
        let leftMenuButton = DrawerBarButtonItem(target: self, action: "menuButtonPressed:")
        self.navigationItem.setLeftBarButtonItem(leftMenuButton, animated: true)

        let rightMenuButton = DrawerBarButtonItem(target: self, action: "toggleSocialDrawer:")
        self.navigationItem.setRightBarButtonItem(rightMenuButton, animated: true)

        // secondView = storyboardy.instantiateViewControllerWithIdentifier("secondView")
        scrollView.contentSize = scrollingContentView.frame.size
        
    }
    override func viewWillAppear(animated: Bool) {

    }
    override func viewDidAppear(animated: Bool) {
        scrollView.contentSize = scrollingContentView.frame.size
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.contentOffset = CGPointMake(0, 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func toggleMenuDrawer(sender: AnyObject) {
        evo_drawerController?.toggleLeftDrawerSideAnimated(true, completion: nil)
    }
    @IBAction func toggleSocialDrawer(sender: AnyObject) {
        evo_drawerController?.toggleDrawerSide(.Right, animated: true, completion: nil)
    }
    @IBAction func unwindToHomeView(segue: UIStoryboardSegue) {
        
    }
    func menuButtonPressed(sender: AnyObject){
        evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {

    }
    func scrollViewDidScroll(scrollView: UIScrollView) {

        if currentState == .ThresholdMet && scrollView.contentOffset.y == 0{
            currentState = .ThresholdNotMet
//            presentViewController(secondView, animated: true, completion: nil)
        }
        if currentState == .ThresholdNotMet && scrollView.contentOffset.y > 45.0 {
            currentState = .ThresholdMet
        }

        //        scrollingContentView.frame.origin.y = scrollView.contentOffset.y
//        if currentState == .Animating {
//            return
//        }

    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if scrollView.contentOffset.y < -45.0 {
//            UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
//                self.scrollView.contentOffset.y = +150.0
//                }, completion: {_ in
//                    self.currentState = .ThresholdNotMet // FIXME: need a real state
//                    self.animateScrollViewSlidingOut(self.scrollView)
//            })
//        }
    }
    func animateScrollViewSlidingOut(scrollView: UIScrollView) {
        print("Animate scrollview")
    }
}

extension DrawerBarButtonItem {
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
}