//
//  dogBreed.swift
//  myAppCustom
//
//  Created by dmorenoar on 22/02/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//


import Foundation
import UIKit
class dogBreed : CustomStringConvertible{
    var id:String
    var name:String
    var country:String
    var image:String
     var isLiked:Bool
    
    init(id:String, name:String, country:String, image:String) {
        self.id = id
        self.name = name
        self.country = country
        self.image = image
        self.isLiked = false
    }
    func getName() -> String {
        return name}
    
    var description : String {
        return "Id:\(id),Name:\(name),Country:\(country),Image:\(image)"
    }
    
}
