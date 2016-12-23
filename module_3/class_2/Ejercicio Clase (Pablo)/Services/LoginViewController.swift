//
//  LoginViewController.swift
//  Services
//
//  Created by Pablo on 22/12/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ALLoadingView

class LoginViewController: UIViewController {
    
    var name = ""
    var email = ""
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    
    
    
    @IBAction func btnEntrar(_ sender: Any) {
        
        //    http://wsvamos-ya.juankuga.io/user-login
        
        ALLoadingView.manager.messageText = "Descargando Datos"
        ALLoadingView.manager.blurredBackground = true
        ALLoadingView.manager.showLoadingView(ofType: .messageWithIndicator, windowMode: ALLVWindowMode.fullscreen, completionBlock: nil)
        
        
        Alamofire.request("http://wsvamos-ya.juankuga.io/user-login", method: .post,
                          parameters:
            [
                //                                "email":"pepito@hotmail.com",
                //                                "passwd":"123456789"
                "email":txtUsuario.text!,
                "passwd":txtClave.text!
            ]
            , encoding: JSONEncoding.default, headers: nil).responseJSON {
                (dataResponse) in
                
                
                ALLoadingView.manager.hideLoadingView()
                
                switch dataResponse.result{
                    
                case .success:
                    let json = JSON(data: dataResponse.data!)
                    
                    
                    self.name = json["name"].stringValue
                    self.email = json["email"].stringValue
                    
                    print("Usuario \(self.name) con correo \(self.email)")
                    
                    self.performSegue(withIdentifier: "fromMainToDetail", sender: nil)
                    
                    //                print(json)
                    
                case .failure(let error):
                    
                    let error2 = error as NSError
                    
                    print(error2.code)
                    
                    let alert = UIAlertController(title: "Error", message: "\(error2.code) Parece que no tienes internet", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
                //            print(dataResponse)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromMainToDetail"{
            let vc = segue.destination as! DetalleViewController
            
            vc.nombre = name
            vc.correo = email
            
            //            vc.empresaRecibida = empresaSeleccionada
        }
    }
    
}
