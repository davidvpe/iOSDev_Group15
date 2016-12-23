//
//  ViewController.swift
//  Services
//
//  Created by David Velarde on 12/22/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ALLoadingView


class ViewController: UIViewController {

    @IBAction func loadData(_ sender: Any) {
        //https://jsonplaceholder.typicode.com/users
        
        //Cmd+B
        
        ALLoadingView.manager.messageText = "Descargando Usuarios"
        
        ALLoadingView.manager.blurredBackground = true
        
        ALLoadingView.manager.showLoadingView(ofType: .messageWithIndicator, windowMode: ALLVWindowMode.fullscreen, completionBlock: nil)

        
        Alamofire.request("https://jsonplaceholder.typicode.com/users", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (dataResponse) in
            
            
            ALLoadingView.manager.hideLoadingView()
            
            switch dataResponse.result {
            
            case .success:
                
                
                let json = JSON(data: dataResponse.data!)
                
                let arrayUsers = json.arrayValue
                
                for jsonUser in arrayUsers{
                    
                    let name = jsonUser["name"].stringValue
                    let email = jsonUser["email"].stringValue
                    
                    print("Usuario \(name) con correo \(email)")
                    
                }
                
                
                
            case .failure(let error):
                
//                let error2 = error as NSError
//                
//                print(error2.code)
                
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
            //print(dataResponse)
            
        }
        
        //Alamofire.request("https://jsonplaceholder.typicode.com/users", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        
        /*Alamofire.request("https://jsonplaceholder.typicode.com/users", method: .get, parameters:
            [
                "user":"davidvpe",
                "password":"123456789"
            ]
            , encoding: JSONEncoding.default, headers: nil)
         */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

