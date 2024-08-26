//
//  PopularDishCollectionViewCell.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 27/07/24.
//

import Kingfisher
import UIKit

class PopularDishCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: PopularDishCollectionViewCell.self)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configure(dish: Dish) {
        dishImageView.layer.cornerRadius = 5
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.imageUrl?.asUrl)
    }
}
