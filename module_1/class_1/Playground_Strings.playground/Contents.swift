//: Playground - noun: a place where people can play

import UIKit

let cadena1 = "David Velarde"

let cadena2 = "Mi nombre es \(cadena1)"

let mayuscula = cadena2.uppercased()
let minuscula = cadena2.lowercased()
let capitalizado = cadena2.capitalized



let cadena3 = "Mateo,Marcos,Lucas,Juan,David,Jorge,Pedro"












func imprimirNombresSeparados(cadenaNombres:String){
    
    let cadena4 = cadenaNombres.components(separatedBy: ",")
    
    for i in 0..<cadena4.count{
        print(cadena4[i])
    }

}









imprimirNombresSeparados(cadenaNombres: cadena3)

let nombre = "David"

nombre.characters

let conEspacios = "Pepe Juan Oswaldo"

conEspacios.replacingOccurrences(of: " ", with: "")




