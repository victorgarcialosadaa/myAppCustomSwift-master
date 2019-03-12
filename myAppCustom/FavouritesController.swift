//
//  FavouritesController.swift
//  myAppCustom
//
//  Created by dmorenoar on 03/03/2019.
//  Copyright © 2019 dmorenoar. All rights reserved.
//

import UIKit

class FavouritesController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var tools:Tools = Tools()
    @IBOutlet weak var favourites: UICollectionView!
    
    @IBOutlet weak var yourFavourites: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.favourites.reloadData()
        print(likedDogs)
        
    }
    func emptyFav(){
        if(likedDogs.count == 0)
        {yourFavourites.text = "You dont have any favourite breeds yet"}
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedDogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favCell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell",for: indexPath) as! CeldaCollection
        

    favCell.nameCollection.text = likedDogs[indexPath.row].name               
                tools.getImage(imagenURL: likedDogs[indexPath.row].image) { (imgRecovered) -> Void in
                    if let imagen = imgRecovered {
                        DispatchQueue.main.async {
                            favCell.imgCollection.image = imagen
                            
                        }}}

        return favCell
        }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favourites.delegate = self
        favourites.dataSource = self }
    }

    

    


