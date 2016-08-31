//
//  ViewController.swift
//  Multiple35
//
//  Created by 前田恵里 on 2016/09/01.
//  Copyright © 2016年 前田恵里. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftSwiped() {
        NSLog("leftSwiped");
    }
    
    @IBAction func rightSwiped() {
        NSLog("rightSwiped");
    }
    
    @IBAction func upSwiped() {
        NSLog("upSwiped");
    }
    
    @IBAction func downSwiped() {
        NSLog("downSwiped");
    }


}

