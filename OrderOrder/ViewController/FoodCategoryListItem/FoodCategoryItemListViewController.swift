//
//  FoodCategoryItemListViewController.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 28/07/24.
//

import ProgressHUD
import UIKit

class FoodCategoryItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dishes: [Dish] = []
    var category: FoodCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        title = category.name
        tableView.register(UINib(nibName: FoodItemListTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: FoodItemListTableViewCell.identifier)
        
        ProgressHUD.animate("Loading...",.triangleDotShift)
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self.dishes = dishes
                tableView.reloadData()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
}

extension FoodCategoryItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodItemListTableViewCell.identifier, for: indexPath) as! FoodItemListTableViewCell
        cell.configure(dish: dishes[indexPath.row % dishes.count])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = FoodItemDetailsViewController.instantiate()
        controller.dishItem = dishes[indexPath.row % dishes.count]
        navigationController?.pushViewController(controller, animated: true)
    }
}
