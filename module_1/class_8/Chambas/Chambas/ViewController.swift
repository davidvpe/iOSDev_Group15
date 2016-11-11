//
//  ViewController.swift
//  Chambas
//
//  Created by David Velarde on 11/3/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var arrayEmpresas = [Empresa]()
    
    var empresaSeleccionada : Empresa?
    
    @IBOutlet weak var tvEmpresas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let empresa1 = Empresa()
        empresa1.nombre = "Amazon"
        empresa1.imagen = "amazon"
        empresa1.descripcion = "Empresa que vende cosas"
        empresa1.numeroEmpleados = 2500
        empresa1.ceo = "Jorge Espinoza"
        empresa1.direccion = "Av. Republica de Panama 2476"
        
        //empresa1.localizacion = CGPoint(x: 35.787873, y: -121.8860108)
        
        let localizacion1 = [ "latitud" :  35.0, "longitud":40.0]
        let localizacion2 = [ "latitud" :  40.0, "longitud":-10.0]
        let localizacion3 = [ "latitud" :  45.0, "longitud":-40.0]
        let localizacion4 = [ "latitud" :  50.0, "longitud":-100.0]
            
        empresa1.localizacion.append(localizacion1)
        empresa1.localizacion.append(localizacion2)
        empresa1.localizacion.append(localizacion3)
        empresa1.localizacion.append(localizacion4)
        
        
        arrayEmpresas.append(empresa1)
        arrayEmpresas.append(empresa1)
        arrayEmpresas.append(empresa1)
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEmpresas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmpresaCell
        

        let empresa = arrayEmpresas[indexPath.row] as Empresa
        
        
        cell.imgEmpresa.image = UIImage(named: empresa.imagen)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        empresaSeleccionada = arrayEmpresas[indexPath.row]
        
        performSegue(withIdentifier: "fromMainToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromMainToDetail"{
            let vc = segue.destination as! DetalleViewController
            
            vc.empresaRecibida = empresaSeleccionada
        }
    }
    
    @IBAction func agregarEmpresa(segue: UIStoryboardSegue){
    
        let vcOrigen = segue.source as! AgregarEmpresaViewController
        
        let empresaCreada = vcOrigen.empresaNueva!
        
        arrayEmpresas.append(empresaCreada)
        
        tvEmpresas.reloadData()
        
    }

}

