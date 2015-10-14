//
//  AvaSummaryViewController.swift
//  Ava
//
//  Created by Jay Lubo on 10/13/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class AvaPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var avaViewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create the 2 ava views
        let v1 = UIViewController()
        v1.view.backgroundColor = UIColor.greenColor()
        let v2 = UIViewController()
        v2.view.backgroundColor = UIColor.grayColor()
        avaViewControllers = [v1, v2]
        
        view!.backgroundColor = UIColor.grayColor()
        delegate = self
        dataSource = self

        setViewControllers([v1], direction: .Forward, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let newIndex: Int
        if let index = avaViewControllers.indexOf(viewController) {
            newIndex = index - 1
            if newIndex < 0 {
                return avaViewControllers.last
            } else {
                return avaViewControllers[newIndex]
            }
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let newIndex: Int
        if let index = avaViewControllers.indexOf(viewController) {
            newIndex = index + 1
            if newIndex >= avaViewControllers.endIndex {
                return avaViewControllers.first
            } else {
                return avaViewControllers[newIndex]
            }
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return avaViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return Int(0)
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
