//
//  ExitoViewController.swift
//  BaseFirebase
//
//  Created by David Velarde on 1/3/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ExitoViewController: UIViewController {

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
    @IBAction func tapOnCerrarSesion(_ sender: Any) {
        
        let firebaseAuth = FIRAuth.auth()
        
        do {
            
            GIDSignIn.sharedInstance().signOut()
            
            try firebaseAuth?.signOut()
            self.navigationController?.popViewController(animated: true)
            
            
            
            
        } catch let signOutError as NSError {
            
            print ("Error signing out: %@", signOutError)
            
        }
        
        
    }

}
