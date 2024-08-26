//
//  FoodCategoryCollectionViewCell.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 25/07/24.
//

import Kingfisher
import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: FoodCategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func configure(category: FoodCategory) {
        categoryImageView.layer.cornerRadius = 5
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.imageUrl.asUrl)
    }
    
}
