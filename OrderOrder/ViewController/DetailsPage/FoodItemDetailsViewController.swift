//
//  FoodItemDetailsViewController.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 28/07/24.
//

import Kingfisher
import ProgressHUD
import UIKit

class FoodItemDetailsViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var dishItem: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateDataInView()
    }
    
    private func populateDataInView() {
        titleLabel.text = dishItem.name
        descriptionLabel.text = dishItem.description
        caloriesLabel.text = dishItem.formattedCalories
        dishImageView.kf.setImage(with: dishItem.imageUrl?.asUrl)
    }
    
    @IBAction func placeOrderClicked(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.error("Please enter your name")
            return
        }
        ProgressHUD.animate("Placing Order...", .pacmanProgress)
        NetworkService.shared.placeOrder(dishId: dishItem.id ?? "",
                                         name: name) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(_):
                ProgressHUD.succeed("Order Placed Successfully!")
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
}
