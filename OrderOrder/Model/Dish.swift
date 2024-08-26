//
//  Dish.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 27/07/24.
//

import Foundation

struct Dish: Codable {
    let id, name, description, imageUrl: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) cal"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageUrl = "image"
        case calories
    }
}
