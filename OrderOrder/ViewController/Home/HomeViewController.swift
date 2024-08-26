//
//  HomeViewController.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 25/07/24.
//

import ProgressHUD
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    
    var foodCategories: [FoodCategory] = []
    var popularDishes: [Dish] = []
    var chefSpecials: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Order Order"
        registerCells()
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        popularDishCollectionView.delegate = self
        popularDishCollectionView.dataSource = self
        chefSpecialCollectionView.delegate = self
        chefSpecialCollectionView.dataSource = self
        
        ProgressHUD.animate("Fetching Delights...", .triangleDotShift)
        NetworkService.shared.fetchAllCategories { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                ProgressHUD.dismiss()
                self.foodCategories = data.categories
                self.popularDishes = data.populars
                self.chefSpecials = data.specials
                
                self.foodCategoryCollectionView.reloadData()
                self.popularDishCollectionView.reloadData()
                self.chefSpecialCollectionView.reloadData()
            case .failure(let failure):
                ProgressHUD.error(failure)
                print("Failed to fetch data")
            }
        }
    }
    
    private func registerCells() {
        foodCategoryCollectionView.register(UINib(nibName: FoodCategoryCollectionViewCell.identifier, bundle: nil),
                                            forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
        popularDishCollectionView.register(UINib(nibName: PopularDishCollectionViewCell.identifier, bundle: nil),
                                           forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifier)
        chefSpecialCollectionView.register(UINib(nibName: ChefSpecialCollectionViewCell.identifier, bundle: nil),
                                           forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCategoryCollectionView:
            return foodCategories.count
        case popularDishCollectionView:
            return popularDishes.count
        case chefSpecialCollectionView:
            return chefSpecials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.identifier,
                                                          for: indexPath) as! FoodCategoryCollectionViewCell
            cell.configure(category: foodCategories[indexPath.row])
            return cell
        case popularDishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishCollectionViewCell.identifier, for: indexPath) as! PopularDishCollectionViewCell
            cell.configure(dish: popularDishes[indexPath.row])
            return cell
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.identifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.configure(dish: chefSpecials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case foodCategoryCollectionView:
            let controller = FoodCategoryItemListViewController.instantiate()
            controller.category = foodCategories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        case popularDishCollectionView, chefSpecialCollectionView:
            let controller = FoodItemDetailsViewController.instantiate()
            let data: [Dish] = (collectionView == popularDishCollectionView) ? popularDishes : chefSpecials
            controller.dishItem = data[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
}
