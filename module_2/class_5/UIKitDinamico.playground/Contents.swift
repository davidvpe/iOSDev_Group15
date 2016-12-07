//: Playground - noun: a place where people can play

import UIKit
import XCPlayground



//let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
//    
//for i in 0...4{
//    let vista = UIView(frame: CGRect(x: i*100, y: 0, width: 100, height: 100))
//    vista.backgroundColor = .red
//    //vista.layer.cornerRadius = 10
//    scrollView.addSubview(vista)
//}

//scrollView.clipsToBounds = true


//scrollView



    //vista.layer.cornerRadius = 10

let vista = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 250))
vista.backgroundColor = UIColor.cyan

for i in 0...5{
    let lblNombre = UILabel(frame: CGRect(x: 0, y: i*50, width: Int(vista.frame.width), height: 50))
    lblNombre.text = "Hola"
    lblNombre.textAlignment = .center
    lblNombre.backgroundColor = .white
    //lblNombre.sizeToFit()
    vista.addSubview(lblNombre)
    
    lblNombre
    
}

vista


let vista2 = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

vista2.backgroundColor = .white
XCPShowView(identifier: "Container View", view: vista2)

let vista3 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

vista3.backgroundColor = .red
vista2.addSubview(vista3)

UIView.animate(withDuration: 2, animations: {
    vista3.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
})








    





