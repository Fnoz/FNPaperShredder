//
//  FNPaperShredder.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/14.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNPaperShredder: UIView {
    var paper:UIView!
    var bars:NSMutableArray!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(frame)
    }
    
    func initView(frame: CGRect) {
        paper = UIView.init(frame: CGRect.init(x: (frame.width - 146) / 2, y: 0, width: 146, height: 75))
        paper.backgroundColor = UIColor.whiteColor()
        addSubview(paper)
        
        bars = NSMutableArray.init(array: [])
        for i in 0...11 {
            let interval = (146 - 8) / 11
            let originX = (frame.width - 146) / 2 - 4 + CGFloat(i * interval)
            let paperBar = FNPaperBar.init(frame: CGRect.init(x: originX, y: 146 - 50, width: 20, height: 50))
            paperBar.backgroundColor = UIColor.whiteColor()
            addSubview(paperBar)
            bars.addObject(paperBar)
        }
        
        let darkRedPart = UIView.init(frame: CGRect.init(x: (frame.width - 176) / 2, y: 110, width: 176, height: 36))
        darkRedPart.layer.cornerRadius = 15
        darkRedPart.layer.masksToBounds = true
        darkRedPart.backgroundColor = UIColor.init(red: 181/255.0, green: 55/255.0, blue: 57/255.0, alpha: 1)
        addSubview(darkRedPart)
        
        let lightRedPart = UIView.init(frame: CGRect.init(x: (frame.width - 176) / 2, y: 74, width: 176, height: 63))
        lightRedPart.layer.cornerRadius = 7
        lightRedPart.layer.masksToBounds = true
        lightRedPart.backgroundColor = UIColor.init(red: 225/255.0, green: 65/255.0, blue: 65/255.0, alpha: 1)
        addSubview(lightRedPart)
        
        let grayPart = FNGrayPart.init(frame: CGRect.init(x: (frame.width - 176) / 2, y: 70, width: 176, height: 11))
        grayPart.backgroundColor = UIColor.init(red: 154/255.0, green: 154/255.0, blue: 154/255.0, alpha: 1)
        addSubview(grayPart)
        
        let textLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: darkRedPart.frame.width, height: 20))
        textLabel.text = "Deleting"
        textLabel.font = UIFont.systemFontOfSize(16)
        textLabel.textColor = UIColor.init(white: 1, alpha: 0.9)
        textLabel.textAlignment = .Center
        textLabel.center = CGPoint.init(x: lightRedPart.center.x, y: lightRedPart.center.y + 2)
        addSubview(textLabel)
    }
    
    func start() {
        UIView.animateWithDuration(2) { 
            self.paper.frame = CGRect.init(x: (self.frame.width - 146) / 2, y: 35, width: 146, height: 75)
        }
        for item in bars {
            UIView.animateWithDuration(2, animations: {
                let paperBar = item as! FNPaperBar
                paperBar.start()
                paperBar.frame = CGRect.init(x: paperBar.frame.origin.x, y: 146, width: paperBar.frame.width, height: paperBar.frame.height)
            })
        }
    }
    
    func reset(animate:Bool) {
        for item in bars {
            let paperBar = item as! FNPaperBar
            paperBar.reset()
        }
        if animate {
            UIView.animateWithDuration(2) {
                self.paper.frame = CGRect.init(x: (self.frame.width - 146) / 2, y: 0, width: 146, height: 75)
            }
            for item in bars {
                UIView.animateWithDuration(2, animations: {
                    let paperBar = item as! FNPaperBar
                    paperBar.frame = CGRect.init(x: paperBar.frame.origin.x, y: 146 - 50, width: paperBar.frame.width, height: paperBar.frame.height)
                })
            }
        }
        else {
            self.paper.frame = CGRect.init(x: (self.frame.width - 146) / 2, y: 0, width: 146, height: 75)
            for item in bars {
                let paperBar = item as! FNPaperBar
                paperBar.frame = CGRect.init(x: paperBar.frame.origin.x, y: 146 - 50, width: paperBar.frame.width, height: paperBar.frame.height)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}