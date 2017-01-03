//
//  ViewController.swift
//  CrashDetection
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class CrashViewController2 : UIViewController {

    var number = 0
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
        
        number = Int(text)!
        
        var texto = ""
        
        while(number >= 0){
        
            texto += "Reduciendo numero por -1\n"
            
        }
        self.title = "\(texto)\n\nNumero \(number)"
        
        
    }

}

