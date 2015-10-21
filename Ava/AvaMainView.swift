//
//  AvaMainView.swift
//  Ava
//
//  Created by Jay Lubo on 10/20/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

@IBDesignable
class AvaMainView: UIView {
    // 6 - 343 x 264
    // 6+ - 374 x 299
    override func drawRect(rect: CGRect) {
        AvaMeters.drawMeter(frame:self.bounds, wheelColor: AvaMeters.growthColor, angle: 85)
    }


}
