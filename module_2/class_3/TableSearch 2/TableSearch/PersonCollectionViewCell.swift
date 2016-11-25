//
//  PersonCollectionViewCell.swift
//  TableSearch
//
//  Created by juan harold kuga palomino on 24/11/16.
//  Copyright © 2016 Diloo. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var downloadingIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.img.layer.cornerRadius = 40
    }
    
    
    
}
