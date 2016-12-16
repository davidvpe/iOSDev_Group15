//
//  ImageTable.swift
//  ManejoCamara
//
//  Created by David Velarde on 12/15/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ImageTableViewController: UIViewController {

    var dataSource = [UIImage]()
    
    @IBOutlet weak var tvPhotos: UITableView!
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Agregar Foto", message: "De donde?", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "De la camara", style: .default) { alert in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self;
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
        }
        let alertAction2 = UIAlertAction(title: "De la galeria", style: .default) { alert in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self;
            imagePicker.sourceType = .savedPhotosAlbum
            self.present(imagePicker, animated: true)
        }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}


extension ImageTableViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotoCell
        cell.imgPhoto.image = dataSource[indexPath.row]
        return cell
    }

}

extension ImageTableViewController : UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("No photo")
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.dataSource.append(originalImage)
        
        picker.dismiss(animated: true) {
            
            self.tvPhotos.reloadData()
            
        }
        
        
    }
    
}


extension ImageTableViewController : UINavigationControllerDelegate {}

