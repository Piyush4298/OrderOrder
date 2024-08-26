//
//  ChefSpecialCollectionViewCell.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 27/07/24.
//

import Kingfisher
import UIKit

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ChefSpecialCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func configure(dish: Dish) {
        dishImageView.kf.setImage(with: dish.imageUrl?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
}
