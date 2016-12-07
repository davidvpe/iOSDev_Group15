//
//  Empresa.swift
//  Chambas
//
//  Created by David Velarde on 11/3/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import RealmSwift

class Empresa: NSObject {

    var nombre = ""
    var imagen : Data!
    var descripcion = ""
    var numeroEmpleados = 0
    var ceo = ""
    var direccion = ""
    var localizacion = [[String:Double]]()
    var fecha : Date!
    
}
