//
//  ViewController.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/14.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var paperShredder:FNPaperShredder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 42/255.0, green: 49/255.0, blue: 67/255.0, alpha: 1)
        
        paperShredder  = FNPaperShredder.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        paperShredder.center = CGPoint.init(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        view.addSubview(paperShredder)
        
        let startBtn = UIButton.init(frame: CGRectMake(0, 0, 40, 40))
        startBtn.backgroundColor = UIColor.init(red: 37/255.0, green: 171/255.0, blue: 22/255.0, alpha: 1)
        startBtn.layer.cornerRadius = 20
        startBtn.center = CGPoint.init(x: paperShredder.center.x - 55, y: paperShredder.center.y + 150)
        startBtn.addTarget(self, action: #selector(start), forControlEvents: .TouchUpInside)
        view.addSubview(startBtn)
        
        let resetBtn = UIButton.init(frame: CGRectMake(0, 0, 40, 40))
        resetBtn.backgroundColor = UIColor.init(red: 225/255.0, green: 65/255.0, blue: 65/255.0, alpha: 1)
        resetBtn.layer.cornerRadius = 20
        resetBtn.center = CGPoint.init(x: paperShredder.center.x + 55, y: paperShredder.center.y + 150)
        resetBtn.addTarget(self, action: #selector(reset), forControlEvents: .TouchUpInside)
        view.addSubview(resetBtn)
    }
    
    func start() {
        paperShredder.start()
    }
    
    func reset() {
        paperShredder.reset(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

