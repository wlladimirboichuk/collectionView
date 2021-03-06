//
//  PhotosCollectionViewController.swift
//  CollectionView
//
//  Created by Volodymyr Boichuk on 08.05.2020.
//  Copyright © 2020 Volodymyr Boichuk. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photos = ["dog1","dog2","dog3","dog4","dog5","dog6","dog7","dog8","dog9","dog10","dog11","dog12","dog13"]
    let itemsPerRow: CGFloat = 3
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    
        // 1-й Способ конфигурации лаяутов.
//
//        let  layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width:70 , height: 30)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//
//        // Снятие скрола
//        collectionView.showsVerticalScrollIndicator = false
        
        
        // Do any additional setup after loading the view.
    }
    
    //Функция поделиться после закрепления ячейки.
    
    override func prepare(for segue: UIStoryboard, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.dogImageView.image 
        }

    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImageView.image = image 
        
    
        // Configure the cell
    
        return cell
    }

}
// 2-Й Способ изменений лаяутов.

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    //sizeFOr - Метод дающий размеры.

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Код для высчитывания точной велечины обьекта автоматически.
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width:widthPerItem , height:widthPerItem )
    }

    //inserFotS - Метод для корекции секции.Задает точные отступы для границ.
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts

    //minimumForsection - Указание отступов.
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    // Расстояние между обьектами.
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    }
}
