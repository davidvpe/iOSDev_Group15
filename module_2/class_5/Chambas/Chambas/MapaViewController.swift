//
//  MapaViewController.swift
//  Chambas
//
//  Created by David Velarde on 11/8/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit


class MapaViewController: UIViewController {

    var empresaRecibida : Empresa?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let url = NSURL(string: "comgooglemaps://?saddr=37.759748,-122.427135&daddr=37.758,-122.425&center=37.422185,-122.083898&zoom=10&directionsmode=walking")
        UIApplication.shared.openURL(url as! URL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
