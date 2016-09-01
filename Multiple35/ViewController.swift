//
//  ViewController.swift
//  Multiple35
//
//  Created by 前田恵里 on 2016/09/01.
//  Copyright © 2016年 前田恵里. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var numberLabel: UILabel!
    
    var positionX : CGFloat!
    var positionY : CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // スワイプ処理
    @IBAction func leftSwiped() {
        NSLog("leftSwiped");
        onAnimation1Click(1)
    }
    
    @IBAction func upSwiped() {
        NSLog("upSwiped");
        onAnimation1Click(2)
    }
    
    @IBAction func rightSwiped() {
        NSLog("rightSwiped");
        onAnimation1Click(3)
    }
    
    @IBAction func downSwiped() {
        NSLog("downSwiped");
        onAnimation1Click(4)
    }
    
    
    // アニメーション処理
    
    func onAnimation1Click(direction:Int) {
        if positionX == nil {
            positionX = self.numberLabel.frame.origin.x
            positionY = self.numberLabel.frame.origin.y
        }
        UIView.animateWithDuration(
            0.3,  // アニメーションの時間
            animations: {() -> Void in
                // アニメーションする処理
                if direction == 1 {
                    self.numberLabel.frame.origin.x = -UIScreen.mainScreen().bounds.width
                } else if direction == 2 {
                    self.numberLabel.frame.origin.y = -UIScreen.mainScreen().bounds.height
                } else if direction == 3 {
                    self.numberLabel.frame.origin.x = UIScreen.mainScreen().bounds.width
                } else if direction == 4 {
                    self.numberLabel.frame.origin.y = UIScreen.mainScreen().bounds.height
                }
            }
            , completion: {(Bool) -> Void in
                // アニメーション終了後の処理
                self.numberLabel.frame.origin.x = self.positionX
                self.numberLabel.frame.origin.y = self.positionY
        })
    }

    
    

}

