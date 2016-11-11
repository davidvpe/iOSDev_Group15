//
//  AgregarEmpresaViewController.swift
//  Chambas
//
//  Created by David Velarde on 11/10/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class AgregarEmpresaViewController: UITableViewController {

    
    var empresaNueva : Empresa?
    
    @IBOutlet weak var txtDescripcion: UITextView!
    @IBOutlet weak var txtEmpleados: UITextField!
    @IBOutlet weak var txtDireccionEmpresa: UITextField!
    @IBOutlet weak var txtCEOEmpresa: UITextField!
    @IBOutlet weak var txtNombreEmpresa: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAgregar(_ sender: Any) {
    
        let nombreEmpresa = txtNombreEmpresa.text
        let direccionEmpresa = txtDireccionEmpresa.text
        let ceoEmpresa = txtCEOEmpresa.text
        let cantidadEmpleados = txtEmpleados.text
        let descripcionEmpresa = txtDescripcion.text
        
        let empresaCreada = Empresa()
        
        empresaCreada.nombre = nombreEmpresa!
        empresaCreada.ceo = ceoEmpresa!
        empresaCreada.descripcion = descripcionEmpresa!
        empresaCreada.direccion = direccionEmpresa!
        empresaCreada.numeroEmpleados = Int(cantidadEmpleados!)!
        empresaCreada.imagen = "amazon"
        
        self.empresaNueva = empresaCreada
        
        
    }
    
    
    
    
    
    @IBAction func onCancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
