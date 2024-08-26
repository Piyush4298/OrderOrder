//
//  GlobalError.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 17/08/24.
//

import Foundation

enum GlobalError: LocalizedError {
    case urlCreationError
    case decodingError
    case unknownError
    case invalidURLError
    case serverError(String)
    
    var description: String {
        switch self {
        case .urlCreationError:
            return "Error while creating the URL request"
        case .decodingError:
            return "Error while decoding response"
        case .unknownError:
            return "Error reason unidentified"
        case .invalidURLError:
            return "URL requested is invalid, please check!"
        case .serverError(let error):
            return error
        }
    }
}
