//
//  FNGrayPart.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/14.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNGrayPart: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bezierPath = UIBezierPath.init();
        bezierPath.moveToPoint(CGPointMake(frame.width / 2, 0))
        bezierPath.addLineToPoint(CGPointMake(2, 0))
        bezierPath.addQuadCurveToPoint(CGPointMake(0, 2), controlPoint: CGPointMake(0, 0))
        bezierPath.addLineToPoint(CGPointMake(0, frame.height * 0.7))
        bezierPath.addQuadCurveToPoint(CGPointMake(6, frame.height), controlPoint: CGPointMake(2, frame.height))
        bezierPath.addLineToPoint(CGPointMake(frame.width - 6, frame.height))
        bezierPath.addQuadCurveToPoint(CGPointMake(frame.width, frame.height * 0.7), controlPoint: CGPointMake(frame.width - 2, frame.height))
        bezierPath.addLineToPoint(CGPointMake(frame.width, 2))
        bezierPath.addQuadCurveToPoint(CGPointMake(frame.width - 2, 0), controlPoint: CGPointMake(frame.width, 0))
        bezierPath.closePath()
        let maskLayer = CAShapeLayer.init()
        maskLayer.path = bezierPath.CGPath
        self.layer.mask = maskLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
