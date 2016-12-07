//
//  DetalleViewController.swift
//  Chambas
//
//  Created by David Velarde on 11/3/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    @IBOutlet weak var lblNombre : UILabel!
    @IBOutlet weak var imgEmpresa : UIImageView!
    
    var empresaRecibida : Empresa?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let imagenDeData = UIImage(data: self.empresaRecibida!.imagen)
        
        imgEmpresa.image = imagenDeData
        
        
        lblNombre.text = empresaRecibida?.nombre
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! MapaViewController
        vc.empresaRecibida = empresaRecibida
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
