//
//  FNPaperPieceFall.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/15.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

extension UIView {
    func fn_fallPaperPiece() {
        self.alpha = 1.0
        let rect = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.height)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        layer.addSublayer(emitter)
        emitter.emitterShape = kCAEmitterLayerRectangle
        emitter.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        emitter.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "paperPiece")!.CGImage
        emitterCell.birthRate = Float(50)
        emitterCell.lifetime = 0.7
        emitterCell.lifetimeRange = 0.7
        
        emitter.emitterCells = [emitterCell]
        emitterCell.yAcceleration = 300.0
        emitterCell.xAcceleration = 0
        emitterCell.velocity = -10.0
        emitterCell.spinRange = CGFloat(2 * M_PI);
        emitterCell.spin = CGFloat(2 * M_PI);
        emitterCell.color = UIColor.init(white: 1, alpha: 1).CGColor
        
        emitterCell.scale = 0.7
        emitterCell.scaleRange = 0.7
        emitterCell.scaleSpeed = -0.1
        
        emitterCell.alphaRange = 1.0
        emitterCell.alphaSpeed = 0
        
        self.backgroundColor = UIColor.clearColor()
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            UIView.animateWithDuration(1.2, animations: {
                self.alpha = 0.99
                }, completion: { (fff) in
                    UIView.animateWithDuration(0.7, animations: {
                        self.alpha = 0
                        }, completion: { (fff) in
                            emitter.removeFromSuperlayer()
                    })
            })
        })
        
    }
    
}