//
//  FruitCell.swift
//  TablasDinamicas
//
//  Created by David Velarde on 10/27/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class FruitCell: UITableViewCell {

    
    @IBOutlet weak var lblFruit: UILabel!
    @IBOutlet weak var imgFruit: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
