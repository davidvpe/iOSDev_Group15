//
//  ViewController.swift
//  LoginFacebook
//
//  Created by David Velarde on 11/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin



class ViewController: UIViewController {
    @IBAction func btnLogin(_ sender: Any) {
        
        let texto = "Hola desde mi aplicacion"
        let image = UIImage()
        let activity = UIActivityViewController(activityItems: [texto,image], applicationActivities: nil)
        self.present(activity, animated: true, completion: nil)
        
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

