//
//  ViewController.swift
//  Clase3_2
//
//  Created by David Velarde on 10/20/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        self.navigationItem.leftBarButtonItem = crearBotonConImagen(imageName: "imageRefresh")
        
        self.navigationItem.rightBarButtonItem = crearBotonConImagen(imageName: "ico_menu")
        
        let image = UIImage(named: "logo_header")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        
        imageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = imageView
        
        
        
    }
    
    func crearBotonConImagen(imageName:String)->UIBarButtonItem{
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        let barButton = UIBarButtonItem(customView: imageView)
        
        return barButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

