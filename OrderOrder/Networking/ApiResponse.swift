//
//  ApiResponse.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 18/08/24.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
