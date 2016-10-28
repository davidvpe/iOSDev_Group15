//
//  ViewController.swift
//  TablasDinamicas
//
//  Created by David Velarde on 10/27/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataSource = [String]()
    var selectedCell = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource = ["Kiwi","Platano","Granada","Mandarina","Lima","Frambuesa","Manzana Roja","Naranja","Manzana Verde","Naranja"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FruitCell
        
        cell.imgFruit.image = UIImage(named: "fruta_\(indexPath.row+1)")
        
        
        cell.lblFruit.text = dataSource[indexPath.row]
        
        //UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        //cell.backgroundColor = .red
        
        //cell.textLabel?.text = "Celda \(indexPath.row)"
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCell = indexPath.row
        
        performSegue(withIdentifier: "fromTableToImage", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ImageViewController
        
        vc.imageName = "fruta_\(selectedCell+1)"
        
        
        
    }


}

