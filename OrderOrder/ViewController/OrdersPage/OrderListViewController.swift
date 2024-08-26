//
//  OrderListViewController.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 28/07/24.
//

import ProgressHUD
import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: FoodItemListTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: FoodItemListTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        ProgressHUD.animate(nil, AnimationType.triangleDotShift)
        NetworkService.shared.fetchAllOrders { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let orders):
                self.orders = orders
                tableView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }

}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodItemListTableViewCell.identifier, for: indexPath) as! FoodItemListTableViewCell
        cell.configure(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = FoodItemDetailsViewController.instantiate()
        controller.dishItem = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
