//
//  ViewController.swift
//  CrashDetection
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var numero = 0
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    override func viewDidLoad() {
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpCrash1(_ sender: Any) {
        self.performSegue(withIdentifier: "crash1", sender: nil)
    }
    @IBAction func touchUpCrash2(_ sender: Any) {
        self.performSegue(withIdentifier: "crash-2", sender: nil)
    }
    @IBAction func touchUpCrash3(_ sender: Any) {
        self.performSegue(withIdentifier: "crash-3", sender: nil)
    }
    @IBAction func touchUpCrash4(_ sender: Any) {
        self.performSegue(withIdentifier: "crash-4", sender: nil)
    }
    @IBAction func touchUpCrash5(_ sender: Any) {
        self.performSegue(withIdentifier: "crash-5", sender: nil)
    }
    @IBAction func touchUpCrash6(_ sender: Any) {
        self.performSegue(withIdentifier: "crash-6", sender: nil)
    }
    @IBAction func touchUpCrash7(_ sender: Any) {
        self.performSegue(withIdentifier: "crash-7", sender: nil)
    }

}


extension ViewController : CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        default:
            print("fue pe :(")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            currentLocation = locations.last
            locationManager.stopUpdatingLocation()
        }
    }

}
