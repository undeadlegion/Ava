//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

//var mainView: MyViewController
var secondViewController: SecondViewController
print("This is a test")

let containerView = UIView(frame: CGRectMake(0.0, 0.0, 375.0, 667.0))
containerView.backgroundColor = UIColor.blueColor()

secondViewController = SecondViewController(nibName: "SecondView", bundle: nil)
containerView.addSubview(secondViewController.view)

let resourcePath = NSBundle.mainBundle().resourcePath
var fileManager = NSFileManager()
NSBundle.mainBundle().pathForResource("Main", ofType: "storyboard")
//var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
try fileManager.contentsOfDirectoryAtPath(resourcePath!)



//var secondViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SecondViewController")


//containerView.addSubview(secondViewController.view)

//containerView.addSubview(secondViewController.view)

XCPShowView("Container View", view: containerView)
