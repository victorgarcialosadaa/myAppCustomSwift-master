//
//  CeldaCustom.swift
//  myAppCustom
//
//  Created by dmorenoar on 22/02/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//

import UIKit

class CeldaCustom: UITableViewCell{

    @IBOutlet weak var dogCountry: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    
    
    @IBOutlet weak var like: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
