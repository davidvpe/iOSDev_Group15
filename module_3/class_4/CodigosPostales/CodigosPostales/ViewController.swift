//
//  ViewController.swift
//  CodigosPostales
//
//  Created by David Velarde on 12/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import Alamofire
import SwiftyJSON
import SVProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var gMap: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    var polygon : GMSPolygon?
    
    var marker : GMSMarker?
    
    var currentLocation : CLLocation?
    
    let camera = GMSCameraPosition.camera(withLatitude: -9.1565528, longitude: -75.4861532, zoom: 5)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gMap.camera = self.camera
        gMap.delegate = self
        
        
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
    func noAuthorizationAlert(){
        let controller = UIAlertController(title: "Sorry", message: "No puedo obtener su ubicacion actual", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    func locateUser(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func gotLocation(){
        if self.marker != nil {
            self.marker?.map = nil
        }
        if self.polygon != nil {
            self.polygon?.map = nil
        }
        self.getPostalCode()
    }
    
    func getPostalCode(){
        
        let latitud = currentLocation!.coordinate.latitude
        let longitud = currentLocation!.coordinate.longitude
        
        Alamofire.request(
            "http://wssigcpnm.mtc.gob.pe/webService/PostalCode?latitud=\(latitud)&longitud=\(longitud)",
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: nil)
            .responseJSON {
                (dataResponse) in
            
                SVProgressHUD.dismiss()
                
                //print(dataResponse)
                
                let json = JSON(data:dataResponse.data!)
                let codigoPostal = json["CodigoPostal"].intValue
                var geometriaCadena = json["GeometriaCadena"].stringValue
                
                geometriaCadena = geometriaCadena.replacingOccurrences(of: "POLYGON ((", with: "")
                geometriaCadena = geometriaCadena.replacingOccurrences(of: "))", with: "")
                
                let arrayGeometria = geometriaCadena.components(separatedBy: ", ")
                
                let position = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
                self.marker = GMSMarker(position: position)
                self.marker!.title = "Codigo Postal: \(codigoPostal)"
                self.marker!.map = self.gMap
            
                let extraCamera = GMSCameraPosition.camera(withLatitude: latitud, longitude: longitud, zoom: 8)
                self.gMap.camera = extraCamera
                
                
                // Create a rectangular path
                let rect = GMSMutablePath()
                
                for localization in arrayGeometria {
                
                    var localizationString = localization.replacingOccurrences(of: ")", with: "")
                    localizationString = localizationString.replacingOccurrences(of: "(", with: "")
                    
                    if localization == "" {
                        continue
                    }
                    
                    let arrayLocalization = localizationString.components(separatedBy: " ")
                    
                    let longitudGeometria = Double(arrayLocalization[0])!
                    let latitudGeometria = Double(arrayLocalization[1])!
                    
                    rect.add(CLLocationCoordinate2D(latitude: latitudGeometria, longitude: longitudGeometria))
                    
                }
                
                // Create the polygon, and assign it to the map.
                self.polygon = GMSPolygon(path: rect)
                self.polygon!.fillColor = UIColor(red: 222.0/255.0, green: 221.0/255.0, blue: 49.0/255.0, alpha: 0.5);
                self.polygon!.strokeColor = .clear
                self.polygon!.strokeWidth = 2
                self.polygon!.map = self.gMap
                
            }
    }
    
}

extension ViewController : UITabBarDelegate {

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let position = tabBar.items!.index(of: item)!
        
        switch position {
        case 0:
            SVProgressHUD.show(withStatus: "Obteniendo localizacion y codigo postal")
            locateUser()
        default:
            showNotYetAlert()
            tabBar.selectedItem = nil
        }
        
        
    }

}


extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedWhenInUse:
            
            locationManager.startUpdatingLocation()
        default:
            noAuthorizationAlert()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if self.currentLocation == nil {
            if locations.count > 0
            {
                let location = locations.last
                self.currentLocation = location
                gotLocation()
            }
        }
        else{
            locationManager.stopUpdatingLocation()
        }
        
    }

}

extension ViewController : GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        currentLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        SVProgressHUD.show(withStatus: "Obteniendo codigo postal")
        gotLocation()
        
    }
    
}

