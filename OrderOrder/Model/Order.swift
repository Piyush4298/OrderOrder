//
//  Order.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 28/07/24.
//

import Foundation

struct Order: Codable {
    let id: String?
    let customerName: String?
    let dish: Dish?
    
    enum CodingKeys: String, CodingKey {
        case id
        case customerName = "name"
        case dish
    }
}
