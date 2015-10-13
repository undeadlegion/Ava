//
//  File.swift
//  TestImageScroll
//
//  Created by Jay Lubo on 10/2/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        print("Yep! Unwind that shit")
    }
    @IBAction func exitToMain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
