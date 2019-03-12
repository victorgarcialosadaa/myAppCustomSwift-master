//
//  InfoList2.swift
//  myAppCustom
//
//  Created by dmorenoar on 01/03/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//

import UIKit


class DetailView:UIViewController{
    
    
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var countryDetail: UILabel!
    @IBOutlet weak var raceDetail: UILabel!
    

    var sampleBreed:dogBreed?
    
    override func
        viewDidLoad() {
        super.viewDidLoad()
        
        raceDetail.text = sampleBreed?.name
        countryDetail.text = sampleBreed?.country
    }
    
    
}
