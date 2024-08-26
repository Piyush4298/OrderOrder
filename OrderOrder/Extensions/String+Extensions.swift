//
//  String+Extensions.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 26/07/24.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
