//
//  InfoList.swift
//  myAppCustom
//
//  Created by dmorenoar on 22/02/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//

import UIKit

class InfoList:UIViewController{
   

    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var countryDetail: UILabel!
    
    @IBOutlet weak var nameDetail: UILabel!
    var dogCountryDetail:String = ""
    var dogRaceDetail:String = ""
    var dogPhotoDetail:UIImage = UIImage()
    
   
    
    override func
        viewDidLoad() {
        super.viewDidLoad()
        /*
imageDetail.image = dogPhotoDetail
nameDetail.text = dogRaceDetail
countryDetail.text=dogCountryDetail*/
     
    }
    

}
