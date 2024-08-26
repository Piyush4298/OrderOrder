//
//  FoodCategory.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 25/07/24.
//

import Foundation

struct FoodCategory: Codable {
    let id, name, imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case imageUrl = "image"
    }
}
