//
//  ViewController.swift
//  CodigosPostales
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

import GoogleMaps

class ViewController: UIViewController {

    
    
    @IBOutlet weak var gMap: GMSMapView!
    
    let camera = GMSCameraPosition.camera(withLatitude: -9.1565528, longitude: -75.4861532, zoom: 5)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gMap.camera = self.camera
        gMap.isMyLocationEnabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showNotYetAlert(){
        let controller = UIAlertController(title: "Sorry", message: "Esto no esta disponible aun", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    func locateUser(){
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}

extension ViewController : UITabBarDelegate {

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let position = tabBar.items!.index(of: item)!
        
        switch position {
        case 0:
            locateUser()
        default:
            showNotYetAlert()
            tabBar.selectedItem = nil
        }
        
        
    }

}

