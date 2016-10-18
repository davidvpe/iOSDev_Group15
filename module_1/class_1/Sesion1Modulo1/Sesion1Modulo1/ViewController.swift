//
//  ViewController.swift
//  Sesion1Modulo1
//
//  Created by David Velarde on 10/13/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nombre = "Hola David Velarde"
    
    let nombres = "Juan, Jorge, Pedro, Oswaldo"
    
    func separarNombres(cadena:String)->String{
        
        let arrayNombres = nombres.components(separatedBy: ",")
        var resultado = ""
        for i in 0..<arrayNombres.count{
        
            resultado = resultado + arrayNombres[i] + "\n"
        }
        return resultado
    }
    
    @IBOutlet weak var lblNombre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblNombre.text = separarNombres(cadena: nombres)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

