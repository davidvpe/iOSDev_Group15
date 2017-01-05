//
//  LoginViewController.swift
//  BaseFirebase
//
//  Created by David Velarde on 1/3/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = FIRAuth.auth()?.currentUser {
            
            print("El usuario logueado es \(user.email)")
            
            self.performSegue(withIdentifier: "exito", sender: nil)
            
        }
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        
        if txtCorreo.text != nil && txtClave.text != nil {
            
            let correo = txtCorreo.text!
            let clave = txtClave.text!
            
            let credential = FIREmailPasswordAuthProvider.credential(withEmail: correo, password: clave)
            
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                
                if error == nil {
                    print("Exito")
                    self.performSegue(withIdentifier: "exito", sender: nil)
                }
                else{
                    print("Fallo")
                    print(error!.localizedDescription)
                }
                
            })
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

}
