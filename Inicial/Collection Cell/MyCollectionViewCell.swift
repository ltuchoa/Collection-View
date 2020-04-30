//
//  MyCollectionViewCell.swift
//  Inicial
//
//  Created by Larissa Uchoa on 28/04/20.
//  Copyright © 2020 Larissa Uchoa. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myImage: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Model){
        self.myImage.image = UIImage(named: model.imageName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }
    
}
