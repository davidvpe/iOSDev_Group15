//
//  ViewController.swift
//  CrashDetection
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class CrashViewController2 : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressMe(_ sender: Any) {
        
        let text = "abcdefghijk"
        var number = Int(text)!
        number += 1
        self.title = "Numero \(number)"
        
        
    }

}

