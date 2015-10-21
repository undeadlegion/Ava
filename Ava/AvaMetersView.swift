//
//  AvaSummaryView.swift
//  Ava
//
//  Created by Jay Lubo on 10/20/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

@IBDesignable
class AvaMetersView: UIView {
    override func awakeFromNib() {
        self.autoresizingMask = .None
    }
    override func drawRect(rect: CGRect) {

        AvaMeters.drawMeter(frame:self.bounds, wheelColor: AvaMeters.growthColor, angle: 85)
    }
}
