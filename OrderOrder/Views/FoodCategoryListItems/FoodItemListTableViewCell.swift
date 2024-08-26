//
//  FoodItemListTableViewCell.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 28/07/24.
//

import Kingfisher
import UIKit

class FoodItemListTableViewCell: UITableViewCell {
    static let identifier = String(describing: FoodItemListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(dish: Dish) {
        dishImageView.layer.cornerRadius = 5
        dishImageView.kf.setImage(with: dish.imageUrl?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    
    func configure(order: Order) {
        dishImageView.layer.cornerRadius = 5
        dishImageView.kf.setImage(with: order.dish?.imageUrl?.asUrl)
        titleLabel.text = order.dish?.name
        descriptionLabel.text = order.customerName
    }
}
