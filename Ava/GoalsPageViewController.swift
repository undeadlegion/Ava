//
//  GoalsSummaryViewController.swift
//  Ava
//
//  Created by Jay Lubo on 10/13/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class GoalsPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var goalsViewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = storyboard!.instantiateViewControllerWithIdentifier("GoalsTableView")
        v1.view.backgroundColor = UIColor.greenColor()
        let v2 = storyboard!.instantiateViewControllerWithIdentifier("GoalsTableView")
        v2.view.backgroundColor = UIColor.grayColor()
        let v3 = storyboard!.instantiateViewControllerWithIdentifier("GoalsTableView")
        v3.view.backgroundColor = UIColor.yellowColor()
        goalsViewControllers = [v1, v2, v3]
        
        delegate = self
        dataSource = self
        
        setViewControllers([v1], direction: .Forward, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let newIndex: Int
        if let index = goalsViewControllers.indexOf(viewController) {
            newIndex = index - 1
            if newIndex < 0 {
                return goalsViewControllers.last
            } else {
                return goalsViewControllers[newIndex]
            }
        }
        return nil        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let newIndex: Int
        if let index = goalsViewControllers.indexOf(viewController) {
            newIndex = index + 1
            if newIndex >= goalsViewControllers.endIndex {
                return goalsViewControllers.first
            } else {
                return goalsViewControllers[newIndex]
            }
        }
        return nil
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
