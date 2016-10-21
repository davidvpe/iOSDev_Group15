import UIKit


let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))

label.text = "Hola amigos!!"
label.textColor = .darkGray
label.textAlignment = NSTextAlignment.center
label.backgroundColor = .white
label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
label.layer.cornerRadius = 5.0
label.layer.borderColor = UIColor.red.cgColor
label.layer.borderWidth = 1
label.layer.masksToBounds = true

label

let imageView = UIImageView(image: UIImage(named: "foto.jpg"))

imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
imageView.contentMode = .scaleAspectFit
imageView.layer.borderColor = UIColor.red.cgColor
imageView.layer.borderWidth = 2

imageView.layer.masksToBounds = false

imageView

let txtUsername = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 44))

txtUsername.layer.borderWidth = 1;
txtUsername.layer.borderColor = UIColor.white.cgColor
txtUsername.textAlignment = .center
txtUsername.placeholder = "Username"
txtUsername.textColor = .white

txtUsername.layer.cornerRadius = 10;
txtUsername.backgroundColor = .white

txtUsername
let fondo = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

fondo.backgroundColor = .white
let vistaColorida = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))

vistaColorida.backgroundColor = .red
fondo.addSubview(vistaColorida)

let nuevoFrame = CGRect(x: 300, y: 300, width: 100, height: 100)
UIView.animate(withDuration: 1) {
    vistaColorida.frame = nuevoFrame
    let rotationTransform = CGAffineTransform(rotationAngle: 3.14)
    vistaColorida.transform = rotationTransform
    
    
}


