//
//  EmpresaBD.swift
//  Chambas
//
//  Created by David Velarde on 12/1/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import RealmSwift

class EmpresaBD: Object {

    dynamic var nombre = ""
    dynamic var imagen : Data!
    dynamic var descripcion = ""
    dynamic var numeroEmpleados = 0
    dynamic var ceo = ""
    dynamic var direccion = ""
    dynamic var fecha : Date!
    
    //dynamic var localizacion = [[String:Double]]()
    
}
