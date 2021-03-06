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
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    var positionX : CGFloat!
    var positionY : CGFloat!
    
    var number: UInt32!
    var point: Int!
    var time: Float!
    var baseTime: Float!
    var lapTime: Float!
    
    var timer: NSTimer!
    var numberAnimationX = CABasicAnimation(keyPath: "position.x")
    var numberAnimationY = CABasicAnimation(keyPath: "position.y")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
        reset()
        createNumber()
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
            numberAnimationX.fromValue = positionX
            numberAnimationY.fromValue = positionY
            numberAnimationX.duration = 0.3
            numberAnimationY.duration = 0.3
        }
        if direction == 1 {
            // 右から左
            numberAnimationX.fromValue = positionX
            numberAnimationX.toValue = -UIScreen.mainScreen().bounds.width
            self.numberLabel.layer.addAnimation(numberAnimationX, forKey: nil)
        } else if direction == 2 {
            // 下から上
            numberAnimationY.fromValue = positionY
            numberAnimationY.toValue = -UIScreen.mainScreen().bounds.height
            self.numberLabel.layer.addAnimation(numberAnimationY, forKey: nil)
        } else if direction == 3 {
            // 左から右
            numberAnimationX.fromValue = positionX + 35
            numberAnimationX.toValue = UIScreen.mainScreen().bounds.width + 280
            self.numberLabel.layer.addAnimation(numberAnimationX, forKey: nil)
        } else if direction == 4 {
            // 上から下
            numberAnimationY.fromValue = positionY + 35
            numberAnimationY.toValue = UIScreen.mainScreen().bounds.height + 280
            self.numberLabel.layer.addAnimation(numberAnimationY, forKey: nil)
        }
        self.nextTurn(direction)

    }
    
    func createNumber() {
        self.number = arc4random_uniform(100)
        self.numberLabel.text = String(self.number)
    }
    
    func reset() {
        point = 0
        baseTime = 60
        lapTime = 0
    }
    
    func nextTurn(direction:Int) {
        decision(direction)
        createNumber()
        pointLabel.text = "point : " + String(point)
    }
    
    // 判定処理
    func decision(direction:Int) {
        switch direction {
        case 1:
            if !check3() && check5() {
                point = point + 1
            } else {
                baseTime = baseTime - 3
            }
        case 2:
            if !check3() && !check5() {
                point = point + 1
            } else {
                baseTime = baseTime - 3
            }
        case 3:
            if check3() && !check5() {
                point = point + 1
            } else {
                baseTime = baseTime - 3
            }
        case 4:
            if check3() && check5() {
                point = point + 1
            } else {
                baseTime = baseTime - 3
            }
        default:
            return
        }
    }

    // 5の倍数ならtrue
    func check5() -> Bool {
        if number % 5 == 0 {
            return true
        }
        return false
    }
    
    // 3の倍数ならtrue
    func check3() -> Bool {
        if number % 3 == 0 {
            return true
        }
        return false
    }
    
    func timerAction() {
        lapTime = lapTime + 0.1
        time = floor((baseTime - lapTime) * 10)/10
        timeLabel.text = "time : " + String(time)
        NSLog(String(time))
        if time <= 0 {
            timer.invalidate()
            self.performSegueWithIdentifier("toResult", sender: nil)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultViewController = segue.destinationViewController as! ResultViewController
        resultViewController.score = point
    }
    

}

