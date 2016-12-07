//
//  DataManager.swift
//  Chambas
//
//  Created by David Velarde on 12/1/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import RealmSwift

class DataManager {
    
    static let shared = DataManager()
    
    private let realm = try! Realm()
    
    private init() {
    }
    
    func addEmpresa(empresa:Empresa){
    
        let empresaBD = EmpresaBD()
        empresaBD.ceo = empresa.ceo
        empresaBD.descripcion = empresa.descripcion
        empresaBD.direccion = empresa.direccion
        empresaBD.imagen = empresa.imagen
        empresaBD.nombre = empresa.nombre
        empresaBD.numeroEmpleados = empresa.numeroEmpleados
        //OJO!!!
        empresaBD.fecha = Date()
        //OJO!!!
        
        //AGREGAMOS A LA BD!
        try! realm.write {
            realm.add(empresaBD)
        }
        
    }
    
    func listEmpresas()->[Empresa] {
        
        let listaDeEmpresas = realm.objects(EmpresaBD.self)
        
        if listaDeEmpresas.count > 0{
            // map ( {
            //          (elementoDelArray) -> QueTipoDeElementoVaARetornar in
            //           Codigo para convertir elementoDelArray a tipo QueTipoDeElementoVaARetornar
            //           return elNuevoElemento
            //     } )
            var arrayEmpresa = [Empresa]()
            for empresaBD in listaDeEmpresas {
                let empresa = Empresa()
                empresa.ceo = empresaBD.ceo
                empresa.descripcion = empresaBD.descripcion
                empresa.direccion = empresaBD.direccion
                empresa.imagen = empresaBD.imagen
                empresa.nombre = empresaBD.nombre
                empresa.numeroEmpleados = empresaBD.numeroEmpleados
                
                arrayEmpresa.append(empresa)
            }
            return arrayEmpresa
        }
        return [Empresa]()
    }
}
