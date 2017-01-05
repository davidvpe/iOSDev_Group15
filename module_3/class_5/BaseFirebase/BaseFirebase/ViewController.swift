//
//  ViewController.swift
//  BaseFirebase
//
//  Created by David Velarde on 12/27/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtClave1: UITextField!
    @IBOutlet weak var txtClave2: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    var credential : FIRAuthCredential? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        GIDSignIn.sharedInstance().delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let user = FIRAuth.auth()?.currentUser {
            
            print("El usuario logueado es \(user.email)")
            
            self.performSegue(withIdentifier: "exito", sender: nil)
            
        }
    }
    
    @IBAction func taoOnRegistrar(_ sender: Any) {
        
        if  (txtCorreo.text?.characters.count)! > 0 &&
            (txtClave1.text?.characters.count)! > 0 &&
            (txtClave2.text?.characters.count)! > 0 {
            
            if txtClave1.text == txtClave2.text {
                
                let correo = txtCorreo.text!
                let clave = txtClave1.text!
                
                FIRAuth.auth()?.createUser(withEmail: correo, password: clave) { (user, error) in
                    
                    if error == nil {
                        
                        print("Exito")
                        
                        self.performSegue(withIdentifier: "exito", sender: nil)
                        
                    }
                    else{
                        print("Fallo")
                        print(error!.localizedDescription)
                    }
                    
                }
                
            }
            
        }
        
        
        
    }
    
    
}

extension ViewController : GIDSignInUIDelegate {

}

extension ViewController : GIDSignInDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            return
        }
        
        guard let authentication = user.authentication else { return }
        
        credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential!, completion: { (user, error) in
            
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

