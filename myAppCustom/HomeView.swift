//
//  ControllerDogs.swift
//  myAppCustom
//
//  Created by dmorenoar on 22/02/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//

import UIKit

class HomeView: UIViewController, UITableViewDelegate,
UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    /**/
    var tools:Tools = Tools()
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath) as! CeldaCustom
            myCell.dogBreed!.text = dogList[indexPath.row].name
            myCell.dogCountry.text = dogList[indexPath.row].country
            tools.getImage(imagenURL: dogList[indexPath.row].image) { (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        myCell.dogImage.image = imagen
                        
                        return
                    }}}
        myCell.like.isHidden = true
        if dogList[indexPath.row].isLiked{
            myCell.like.isHidden = false
        }
        
       
        

        return myCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "detailDog") as! DetailView
        
        
        
        vc.sampleBreed = dogList[indexPath.row]
        print(vc.sampleBreed!)
        /*tools.getImage(imagenURL: dogList[indexPath.row].image) { (imgRecovered) -> Void in
         if let imagen = imgRecovered {
         DispatchQueue.main.async {
         vc.imgDetail.image = imagen}}*/
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.performSegue(withIdentifier: "detailDogShowHome", sender: self)
        })
        
    }
    
   
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let isLiked = likedCategory(indexPath:indexPath)
        //Adjuntamos todas las opciones que necesitemos en modo de array
        return UISwipeActionsConfiguration(actions: [isLiked])
    }
    
    func likedCategory(indexPath:IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, completion) in
            dogList[indexPath.row].isLiked = !dogList[indexPath.row].isLiked
            self.tableView.reloadRows(at: [indexPath], with: .none)
            action.title = "You like this!"
            completion(true)
            likedDogs.append(dogList[indexPath.row])
            
        }
        
        action.title = dogList[indexPath.row].isLiked ? "Dislike!" : "Like"
        action.image = UIImage(named: "like")
        action.backgroundColor =  dogList[indexPath.row].isLiked ? UIColor.purple : UIColor.gray
        
        /*dogList[indexPath.row].isLiked ?
         likedDogs.append(dogList[indexPath.row]) : likedDogs.remove(at: likedDogs.index(of :dogList[indexPath.row]))*/
        
        
        return action
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let vc = storyboard?.instantiateViewController(withIdentifier: "dogController") as! ControllerDogs*/
        tools.parseCSVBreed(breeds: &dogList)
        tableView.delegate = self
        tableView.dataSource = self
          }
    
    
    
    
}
