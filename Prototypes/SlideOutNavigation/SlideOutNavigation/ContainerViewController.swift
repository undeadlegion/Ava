//
//  ContainerViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}

class ContainerViewController: UIViewController {
    var centerViewController: CenterViewController!
    var currentState: SlideOutState = .BothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    var leftViewController: SidePanelViewController?
    var rightViewController: SidePanelViewController?
    var centerNavigationController: UINavigationController!
    
    let centerPanelExpandedOffset: CGFloat = 60
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    centerViewController = UIStoryboard.centerViewController()
    centerViewController.delegate = self


    // wrap center view controller in a UINavigationController so we can push views to it, and display bar button items
    centerNavigationController = UINavigationController(rootViewController: centerViewController)
    view.addSubview(centerNavigationController.view)
    addChildViewController(centerNavigationController)
    centerNavigationController.didMoveToParentViewController(self)

    let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
    panGestureRecognizer.cancelsTouchesInView = false
    centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    
    let screenEdgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "handleScreenEdgeGesture:")
    screenEdgeGestureRecognizer.edges = .Left
//    centerNavigationController.view.addGestureRecognizer(screenEdgeGestureRecognizer)

    }
  
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        super.touchesBegan(touches, withEvent: event)
//    }
}

extension ContainerViewController: CenterViewControllerDelegate {
    func collapseSidePanels(){
        switch currentState {
        case    .LeftPanelExpanded:
                toggleLeftPanel()
        case    .RightPanelExpanded:
                toggleRightPanel()
        default:
            break
        }
    }
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = currentState != .LeftPanelExpanded
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func toggleRightPanel() {
        let notAlreadyExpanded = currentState != .RightPanelExpanded
        if notAlreadyExpanded {
            addRightPanelViewController()
        }
        animateRightPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            leftViewController!.animals = Animal.allCats()
            leftViewController!.delegate = centerViewController
            
            addChildSidePanelController(leftViewController!)
        } else {

        }
    }

    func addRightPanelViewController() {
        if (rightViewController == nil) {
            rightViewController = UIStoryboard.rightViewController()
            rightViewController!.animals = Animal.allDogs()
            rightViewController!.delegate = centerViewController
            
            addChildSidePanelController(rightViewController!)
        } else {
            
        }
    }

    func addChildSidePanelController(sidePanelController: SidePanelViewController) {
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }

    func animateLeftPanel(shouldExpand shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .LeftPanelExpanded
//            view.bringSubviewToFront(leftViewController!.view)
//            view.bringSubviewToFront(centerNavigationController!.view)
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset)
        } else {
            currentState = .BothCollapsed
            animateCenterPanelXPosition(targetPosition: 0) { _ in
            self.leftViewController!.view!.removeFromSuperview()
            self.leftViewController = nil
                
            }
            
//            view.willRemoveSubview(leftViewController!.view)
//            leftViewController!.removeFromParentViewController()
        }
    }
    
    func animateRightPanel(shouldExpand shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .RightPanelExpanded
            
//            view.bringSubviewToFront(rightViewController!.view)
//            view.bringSubviewToFront(centerNavigationController!.view)
            
            animateCenterPanelXPosition(targetPosition: -CGRectGetWidth(centerNavigationController!.view.frame) + centerPanelExpandedOffset, completion: nil)
        } else {
            currentState = .BothCollapsed
            animateCenterPanelXPosition(targetPosition: 0) { _ in

            self.rightViewController!.view.removeFromSuperview()
            self.rightViewController = nil

            }
//            self.rightViewController!.removeFromParentViewController()
//            view.willRemoveSubview(rightViewController!.view)

        }
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNavigationController.view.layer.shadowOpacity = 1.0
            centerNavigationController.view.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0
            centerNavigationController.view.layer.shadowOffset = CGSizeMake(0, -3.0)
        }
        
    }
}

extension ContainerViewController: UIGestureRecognizerDelegate {
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let velocityInView = recognizer.velocityInView(view)

        handleDrawerSliding(recognizer)
        
        // scrolling
        if (velocityInView.y > velocityInView.x ) {
            handleScreenEdgeGesture(recognizer)
        } else { // swiping

        }
    }
    func handleDrawerSliding(recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        switch (recognizer.state) {
        case .Began:
        if (currentState == .BothCollapsed) {
        if (gestureIsDraggingFromLeftToRight) {
        addLeftPanelViewController()
        } else {
        addRightPanelViewController()
        }
        showShadowForCenterViewController(true)
        }
        case .Changed:
        recognizer.view!.center.x += recognizer.translationInView(view).x
        recognizer.setTranslation(CGPointZero, inView: view)
        case .Ended:
        let movedMoreThanHalfway: Bool
        if (leftViewController != nil) {
        movedMoreThanHalfway = recognizer.view!.frame.origin.x >= view.center.x
        animateLeftPanel(shouldExpand: movedMoreThanHalfway)
        
        } else if (rightViewController != nil) {
        let movedMoreThanHalfway = recognizer.view!.frame.origin.x + recognizer.view!.frame.size.width <= view.center.x
        animateRightPanel(shouldExpand: movedMoreThanHalfway)
        }
        default:
        break
        }
    }
    func handleScreenEdgeGesture(recognizer: UIPanGestureRecognizer) {

    }
}

private extension UIStoryboard {
  class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
  
  class func leftViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController
  }
  
  class func rightViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SidePanelViewController
  }
  
  class func centerViewController() -> CenterViewController? {
    return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
  }
  
}