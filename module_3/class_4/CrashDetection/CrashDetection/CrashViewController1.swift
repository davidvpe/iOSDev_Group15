//
//  ViewController.swift
//  CrashDetection
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class CrashViewController1 : UIViewController {

    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtSecond: UITextField!
    @IBOutlet weak var lblResultado: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        
        let firstNumber = Int(txtFirst.text!)
        var secondNumber = Int(txtSecond.text!)
        secondNumber = secondNumber! - secondNumber!
        let result = firstNumber!/secondNumber!;
        lblResultado.text = "\(result)"
        
        
    }

}

