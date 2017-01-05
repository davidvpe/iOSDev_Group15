//
//  ViewController.swift
//  CrashDetection
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class CrashViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        
        let array = (UIApplication.shared.delegate as! AppDelegate).giveMeRandomNumber().components(separatedBy: ",")
        let number = Int(array.first!) as AnyObject
        let realNumber = number as! UILabel
        
        
        
        let controller = UIAlertController(title: "Numero Random", message: "Numero: \(realNumber.text)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }

}

