//
//  SideDrawerController.swift
//  Ava
//
//  Created by Jay Lubo on 10/13/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit
import DrawerController

enum EmbedWithinDrawerControllerSegue: String {
    case centerViewController = "centerViewController"
    case leftDrawerViewController = "leftDrawerViewController"
    case rightDrawerViewController = "rightDrawerViewController"
}

class EmbedWithinDrawerController: UIStoryboardSegue {
    override func perform() {
        // this segue does nothing during actual execution
    }
}

class SideDrawerViewController: DrawerController {
    var stateRestored = false

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return true
    }
    override func awakeFromNib() {
        if storyboard != nil {
            closeDrawerGestureModeMask = .All
            openDrawerGestureModeMask = .All
            maximumLeftDrawerWidth = 50.0
            maximumRightDrawerWidth = 160.0
            showsShadows = true

            performSegueWithIdentifier(EmbedWithinDrawerControllerSegue.centerViewController.rawValue, sender: self)
            performSegueWithIdentifier(EmbedWithinDrawerControllerSegue.leftDrawerViewController.rawValue, sender: self)
            performSegueWithIdentifier(EmbedWithinDrawerControllerSegue.rightDrawerViewController.rawValue, sender: self)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.isKindOfClass(EmbedWithinDrawerController) {
            switch segue.identifier! {
            case EmbedWithinDrawerControllerSegue.centerViewController.rawValue:
                self.centerViewController = segue.destinationViewController
            case EmbedWithinDrawerControllerSegue.leftDrawerViewController.rawValue:
                self.leftDrawerViewController = segue.destinationViewController
            case EmbedWithinDrawerControllerSegue.rightDrawerViewController.rawValue:
                self.rightDrawerViewController = segue.destinationViewController
            default:
                print("Unexpected segue identifier of class \(segue.dynamicType)")
            }
        }
    }
}
