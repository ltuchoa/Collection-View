//
//  CollectionTableViewCell.swift
//  Inicial
//
//  Created by Larissa Uchoa on 28/04/20.
//  Copyright © 2020 Larissa Uchoa. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var headerTitle: UILabel!
    
    @IBOutlet var headerButton: UIButton!
    
    func titulo(title: String) {
        self.headerTitle.text = title
    }
    
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
    var models = [Model]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    // COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: models[indexPath.row])
        cell.myImage.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 100)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        UIView.animate(withDuration: 0.1,
//                       animations: {
//                        //Fade-out
//                        cell?.alpha = 0.7
//        })
//        { (completed) in
//            UIView.animate(withDuration: 0.1,
//                           animations: {
//                            //Fade-out
//                            cell?.alpha = 1
//            })
//        }
//
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) {
//
//        }
//    }
    
    
    
}
