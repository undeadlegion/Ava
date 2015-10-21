//
//  GoalsTableViewCell.swift
//  Ava
//
//  Created by Jay Lubo on 10/18/15.
//  Copyright © 2015 JLubo. All rights reserved.
//

import UIKit

class GoalsTableViewCell: UITableViewCell {
    var checkedOff = false
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        checkedOff = selected
        setNeedsDisplay()
    }

    override func drawRect(rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(4, 4, 35, 35))
        UIColor.grayColor().setFill()
        ovalPath.fill()


        if (checkedOff) {
            //// Rectangle Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 13.51, 19.49)
            CGContextRotateCTM(context, 45 * CGFloat(M_PI) / 180)

            let rectanglePath = UIBezierPath(rect: CGRectMake(0, 0, 12.28, 4.96))
            UIColor.blueColor().setFill()
            rectanglePath.fill()

            CGContextRestoreGState(context)


            //// Rectangle 2 Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 16, 27.17)
            CGContextRotateCTM(context, -45 * CGFloat(M_PI) / 180)
            
            let rectangle2Path = UIBezierPath(rect: CGRectMake(0, 0, 19.21, 4.83))
            UIColor.blueColor().setFill()
            rectangle2Path.fill()
            
            CGContextRestoreGState(context)
        }
    }

}
