//
//  ViewController.swift
//  Gesturas
//
//  Created by David Velarde on 12/6/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //var numberOfElements = 5
    
    var numberOfElements = 5
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createAndSetupTableView()
        createAndSetupGestures()
    }

    func createAndSetupGestures(){
    
        let viewGreen = UIView(frame: CGRect(x: 10, y: 450, width: 100, height: 100))
        viewGreen.backgroundColor = .green
        
        self.view.addSubview(viewGreen)
        
        let viewRed = UIView(frame: CGRect(x: 150, y: 450, width: 100, height: 100))
        viewRed.backgroundColor = .red
        
        self.view.addSubview(viewRed)
        
        let tapGestureRecognizerGreen = UITapGestureRecognizer(target: self, action: #selector(addElement))
        viewGreen.addGestureRecognizer(tapGestureRecognizerGreen)
        
        let tapGestureRecognizerRed = UITapGestureRecognizer(target: self, action: #selector(removeElement))
        viewRed.addGestureRecognizer(tapGestureRecognizerRed)
    }
    
    func addElement(){
        
        numberOfElements+=1
        
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
        
        
    }
    func removeElement(){
        if numberOfElements > 0 {
            numberOfElements-=1
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createAndSetupTableView(){
        
        let screenSize = UIScreen.main.bounds
        
        tableView = UITableView(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 400))
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.numberOfElements = 5;
//        let fontFamilyNames = UIFont.familyNames
//        for familyName in fontFamilyNames {
//            print("------------------------------")
//            print("Font Family Name = [\(familyName)]")
//            let names = UIFont.fontNames(forFamilyName: familyName as! String)
//            print("Font Names = [\(names)]")
//        }
        
    }
    
}


extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfElements
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard var cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
//            
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//            
//        }
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if(cell != nil){
            print("Estamos obteniendo la celda \(cell!.tag)")
        
        }
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
            
            let image = UIImage(named: "bart")
            
            imageView.image = image
            
            imageView.backgroundColor = .black
            
            imageView.clipsToBounds = true
            
            imageView.layer.cornerRadius = 40
            
            cell?.addSubview(imageView)
            
            let screenWidth = UIScreen.main.bounds.size.width
            
            let lblNombre = UILabel(frame: CGRect(x: 100, y: 10, width: screenWidth - 120, height: 40))
            
            lblNombre.text = "Bart - \(indexPath.row)"
            
            lblNombre.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
            
            cell?.addSubview(lblNombre)
            
            let lblApellido = UILabel(frame: CGRect(x: 100, y: 50, width: screenWidth - 120, height: 40))
            
            lblApellido.text = "Simpson"
            
            lblApellido.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
            
            cell?.addSubview(lblApellido)
            
        }
        
        cell?.tag = indexPath.row
        
        return cell!
    }

}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

}


