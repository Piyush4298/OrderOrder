//
//  AllDishes.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 19/08/24.
//

import Foundation

struct AllDishes: Codable {
    let categories: [FoodCategory]
    let populars: [Dish]
    let specials: [Dish]
}
