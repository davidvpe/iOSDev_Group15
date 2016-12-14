//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by David Velarde on 12/13/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onTap(_ sender: Any) {
        print("Tap")
    }
    @IBAction func onPinch(_ sender: Any) {
        print("Pinch")
    }
    @IBAction func onRotation(_ sender: Any) {
        print("Rotation")
    }
    @IBAction func onSwipe(_ sender: Any) {
        print("Swipe")
    }
    @IBAction func onPan(_ sender: Any) {
        print("Pan")
    }
    @IBAction func onLongPress(_ sender: Any) {
        print("Long Press")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

