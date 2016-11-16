//
//  ViewController.swift
//  AnimacionFade
//
//  Created by David Velarde on 11/15/16.
//  Copyright © 2016 Diloo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapOnFade(_ sender: Any) {
        
        let imgView2 = UIImageView(image: UIImage(named: "polloCocinado"))
        
        imgView2.frame = imgView1.frame
        imgView2.contentMode = .scaleAspectFill
        imgView2.layer.opacity = 0
        
        self.view.addSubview(imgView2)
        
        UIView.animate(withDuration: 1, animations: {
            
            imgView2.layer.opacity = 1
            self.imgView1.layer.opacity = 0
            
        }, completion: {
            completed in
            self.imgView1.image = imgView2.image
            self.imgView1.layer.opacity = 1
            imgView2.removeFromSuperview()
        })
        
    }

}

