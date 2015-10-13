//
//  TablePageViewController.swift
//  TestImageScroll
//
//  Created by Jay Lubo on 10/9/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class TablePageViewController: UIPageViewController {
    
    var avaViewControllers: [UIViewController]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        let v1 = storyboard!.instantiateViewControllerWithIdentifier("TableView")
        v1.view.backgroundColor = UIColor.blueColor()
        let v2 = storyboard!.instantiateViewControllerWithIdentifier("TableView")
        v2.view.backgroundColor = UIColor.brownColor()
        let v3 = storyboard!.instantiateViewControllerWithIdentifier("TableView")
        v3.view.backgroundColor = UIColor.greenColor()
        avaViewControllers = [v1, v2, v3]
        
        view!.backgroundColor = UIColor.grayColor()
        setViewControllers([avaViewControllers.first!], direction: .Forward, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension TablePageViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = avaViewControllers.indexOf(viewController) {
            let newIndex = index - 1
            if (newIndex < 0) {
                return avaViewControllers.last
            } else {
                return avaViewControllers[newIndex]
            }
        }
        return nil;
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = avaViewControllers.indexOf(viewController) {
            let newIndex = index + 1
            if (newIndex  == avaViewControllers.endIndex) {
                return avaViewControllers.first
            } else {
                return avaViewControllers[newIndex]
            }
        }
        return nil;
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

extension TablePageViewController: UIPageViewControllerDelegate {
    
}
