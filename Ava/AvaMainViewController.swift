//
//  AvaMainViewController.swift
//  Ava
//
//  Created by Jay Lubo on 10/13/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class AvaMainViewController: UIViewController {
    var mainView:AvaMainView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = AvaMainView()
        view = mainView
        view.backgroundColor = UIColor.grayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        mainView = nil
    }
    



}
