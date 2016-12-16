//
//  ViewController.swift
//  ManejoCamara
//
//  Created by David Velarde on 12/15/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePicture(_ sender: Any) {
        imagePicker.sourceType = .camera
        self.navigationController?.present(imagePicker, animated: true)
    }
    
    @IBAction func openGallery(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        self.navigationController?.present(imagePicker, animated: true)
    }

}


extension ViewController : UIImagePickerControllerDelegate{

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("No photo")
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let metadata = info[UIImagePickerControllerMediaMetadata]
        dump(metadata)
        
        picker.dismiss(animated: true) { 
            self.imageView.image = originalImage
        }
        
        
    }
    
}


extension ViewController : UINavigationControllerDelegate {}

extension ViewController : UIScrollViewDelegate{

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
