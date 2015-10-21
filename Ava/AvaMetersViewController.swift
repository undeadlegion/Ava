//
//  AvaSummaryViewController.swift
//  Ava
//
//  Created by Jay Lubo on 10/13/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class AvaMetersViewController: UIViewController {
    var metersView: AvaMetersView!

    override func viewDidLoad() {
        super.viewDidLoad()
        metersView = AvaMetersView()
        view.addSubview(metersView)
        metersView.center = view.center
        view.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        metersView = nil
    }

}
