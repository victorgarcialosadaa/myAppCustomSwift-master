//
//  ControllerDogs.swift
//  myAppCustom
//
//  Created by dmorenoar on 22/02/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//

import UIKit
var dogList:[dogBreed] = [dogBreed]()
var likedDogs:[dogBreed] = [dogBreed]()
class ControllerDogs: UIViewController, UITableViewDelegate,
UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
     /**/
    var tools:Tools = Tools()
   

    /*seachBar*/
       @IBOutlet weak var searchOutlet: SearchBarController!
    var dogFilter:[dogBreed] = [dogBreed]()
    var isSearching:Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !isSearching ? dogList.count : dogFilter.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath) as! CeldaCustom
        if isSearching {
            myCell.dogBreed.text = dogFilter[indexPath.row].name
            myCell.dogCountry.text = dogFilter[indexPath.row].country
            /*if dogList[indexPath.row].image == "null"{
                myCell.isHidden = true
            }*/
            print(dogList[indexPath.row].image)
            
        }else{
            myCell.dogBreed!.text = dogList[indexPath.row].name
            myCell.dogCountry.text = dogList[indexPath.row].country
            tools.getImage(imagenURL: dogList[indexPath.row].image) { (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        myCell.dogImage.image = imagen
                        
                        /*return*/
                    }}}        }
        myCell.like.isHidden = true
        if dogList[indexPath.row].isLiked{
            myCell.like.isHidden = false
        }
        
       
        return myCell
    }
    
   
    	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dogFilter = dogList.filter({ (dogBreed) -> Bool in
            return dogBreed.name.lowercased().contains(searchText.lowercased())
        })
        isSearching = searchText != "" ? true : false
        
        tableView.reloadData()
}
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "detailDog") as! DetailView
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.performSegue(withIdentifier: "detailDogShow", sender: self)
        })
	        vc.sampleBreed = dogList[indexPath.row]
        print(vc.sampleBreed!)
        
        /*
        tools.getImage(imagenURL: dogList[indexPath.row].image) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    vc.imgDetail.image = imagen}*/
        
    }
  
        
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let isLiked = likedCategory(indexPath:indexPath)
        
        return UISwipeActionsConfiguration(actions: [isLiked])
    }
    
    func likedCategory(indexPath:IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, completion) in
            dogList[indexPath.row].isLiked = !dogList[indexPath.row].isLiked
            self.tableView.reloadRows(at: [indexPath], with: .none)
            action.title = "You like this!"
            
        
            
        }
        
        action.title = dogList[indexPath.row].isLiked ? "Dislike!" : "Like"
        action.image = UIImage(named: "like")
        action.backgroundColor =  dogList[indexPath.row].isLiked ? UIColor.purple : UIColor.gray
        
        if(dogList[indexPath.row].isLiked == false)
        {likedDogs.append(dogList[indexPath.row])}
        else if (dogList[indexPath.row].isLiked == true){
            
        let dogElement = dogList[indexPath.row]
            /*a la hora de eliminar no he encontrado la manera de eliminar el elemendo seleccionado porque remove() pide la posicion (int)*/
            likedDogs.removeLast()
        }
        
        
        
        return action
        }
    override func viewDidLoad() {
       
              tools.parseCSVBreed(breeds: &dogList)
        tableView.delegate = self
        tableView.dataSource = self
        searchOutlet.delegate = self
        searchOutlet.placeholder = "Search dog by race"    }
    
   


}
