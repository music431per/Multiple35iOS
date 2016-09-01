//
//  ResultViewController.swift
//  Multiple35
//
//  Created by 前田恵里 on 2016/09/02.
//  Copyright © 2016年 前田恵里. All rights reserved.
//


import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreLabel.text = "score : " + String(score)
    }
    
}