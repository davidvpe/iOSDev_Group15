//
//  CollectionViewController.swift
//  TableSearch
//
//  Created by juan harold kuga palomino on 24/11/16.
//  Copyright © 2016 Diloo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var dataSource = [Person]()
    var dataSourceResults = [Person]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSource()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initDataSource(){
        
        
        
        dataSource.append(Person(name: "Jorge", age: Int(arc4random_uniform(100)), status: "Life is short"))
        dataSource.append(Person(name: "Esperanza", age: Int(arc4random_uniform(100)), status: "I don’t want to earn my living; I want to live"))
        dataSource.append(Person(name: "Oswaldo", age: Int(arc4random_uniform(100)), status: "Live for yourself"))
        dataSource.append(Person(name: "Patricio", age: Int(arc4random_uniform(100)), status: "Work hard. Dream big"))
        dataSource.append(Person(name: "Bob", age: Int(arc4random_uniform(100)), status: "What screws us up the most in life is the picture in our head of how it is supposed to be"))
        dataSource.append(Person(name: "Calamardo", age: Int(arc4random_uniform(100)), status: "Life is short. Live passionately"))
        dataSource.append(Person(name: "Clementina", age: Int(arc4random_uniform(100)), status: "Life shrinks or expands in proportion to one’s courage"))
        dataSource.append(Person(name: "Don Cangrejo", age: Int(arc4random_uniform(100)), status: "Life is a one time offer, use it well"))
        dataSource.append(Person(name: "Arenita", age: Int(arc4random_uniform(100)), status: "Life must be lived forwards, but can only be understood backwards"))
        dataSource.append(Person(name: "Plankton", age: Int(arc4random_uniform(100)), status: "The trouble is you think you have time"))
        dataSource.append(Person(name: "Tom", age: Int(arc4random_uniform(100)), status: "So it goes"))
        dataSource.append(Person(name: "Oliver", age: Int(arc4random_uniform(100)), status: "Life is a shipwreck, but we must not forget to sing in the lifeboats"))
        dataSource.append(Person(name: "Daniel", age: Int(arc4random_uniform(100)), status: "Whatever you are, be a good one"))
        dataSource.append(Person(name: "David", age: Int(arc4random_uniform(100)), status: "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment"))
        dataSource.append(Person(name: "Juan", age: Int(arc4random_uniform(100)), status: "Everything happens for a reason"))
        dataSource.append(Person(name: "Pablo", age: Int(arc4random_uniform(100)), status: "Be the change you wish to see in the world"))
        dataSource.append(Person(name: "Esperanza", age: Int(arc4random_uniform(100)), status: "Life is ten percent what happens to you and ninety percent how you respond to it"))
        dataSource.append(Person(name: "Rocky", age: Int(arc4random_uniform(100)), status: "Youth is counted sweetest by those who are no longer young"))
        dataSource.append(Person(name: "Chumel", age: Int(arc4random_uniform(100)), status: "What a wonderful life I’ve had! I only wish I’d realized it sooner"))
        dataSource.append(Person(name: "Bruno", age: Int(arc4random_uniform(100)), status: "This is your life, and it’s ending one minute at a time"))
        dataSource.append(Person(name: "Victor", age: Int(arc4random_uniform(100)), status: "Love the life you live, and live the life you love"))
        dataSource.append(Person(name: "Paolo", age: Int(arc4random_uniform(100)), status: "It has been my philosophy of life that difficulties vanish when faced boldly"))
        dataSource.append(Person(name: "Miguel", age: Int(arc4random_uniform(100)), status: "Live each day as if it’s your last"))
        dataSource.append(Person(name: "Teresa", age: Int(arc4random_uniform(100)), status: "A man is not old until his regrets take the place of his dreams"))
        
        
    }

   
}


extension CollectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PersonCollectionViewCell
        let person : Person
        
        person = dataSource[indexPath.item] as Person
        
        if person.photo != nil
        {
            cell.downloadingIndicator.stopAnimating()
            cell.downloadingIndicator.isHidden = true
            cell.img.image = person.photo
        }
        else{
            cell.downloadingIndicator.startAnimating()
            
            cell.downloadingIndicator.isHidden = false
            
            let queue = DispatchQueue.init(label: "com.davidvpe.tablesearch.low")
            
            queue.async {
                
                let imageData = try! Data(contentsOf: URL(string:person.photoURL)!)
                
                person.photo = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    collectionView.reloadItems(at: [indexPath])
                }
                
            }
        }
        
       
        
        
        cell.lblname.text = "\(person.name), \(person.age)"
        
        return cell
    }
    
}


extension CollectionViewController : UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let person = dataSource[indexPath.item]
        
        let alert = UIAlertController (
            
            title: "\(person.name)",
            message: "\(person.status)",
            preferredStyle: .alert
        
        )
        
        let alertAction1 = UIAlertAction(
            title: "Ok",
            style: .default,
            handler:nil
        )
        
        alert.addAction(alertAction1)
        
        
        self.present(alert, animated: true, completion: nil)
        
    }

}








