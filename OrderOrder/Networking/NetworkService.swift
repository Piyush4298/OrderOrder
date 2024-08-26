//
//  NetworkService.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 17/08/24.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>)->Void) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
    }
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], Error>)->Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    func fetchAllOrders(completion: @escaping(Result<[Order], Error>)->Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
    }
    
    private init() {}
    
    /// To generate a URLRequest
    /// - Parameters:
    ///   - route: path to the backend resource
    ///   - method: type of request to be made
    ///   - parameters: extra information to be passed to backend, either thorugh query params or through body based on method type
    /// - Returns: URLRequest?
    private func createRequest(route: Route,
                              method: Method,
                              parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let parameters {
            switch method {
            case .get:
                var urlComponents = URLComponents(string: urlString)
                urlComponents?.queryItems = parameters.map {
                    return URLQueryItem(name: $0, value: "\($1)")
                }
                urlRequest.url = urlComponents?.url
            case .post:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters)
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
    
    
    /// To make a request to the given route.
    /// - Parameters:
    ///   - route: path to the backend resource
    ///   - method: type of request to be made
    ///   - parameters: extra information to be passed to backend, either thorugh query params or through body based on method type
    ///   - type: Type of the result data
    ///   - completion: completion handler with respose
    private func request<T: Codable>(route: Route,
                            method: Method,
                            parameters: [String: Any]? = nil,
                            completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(GlobalError.urlCreationError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data, error == nil {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify response"
                print("Response string: \(responseString)")
            } else if let error {
                result = .failure(error)
                //print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Codable>(result: Result<Data, Error>?,
                                            completion: (Result<T, Error>) -> Void) {
        guard let result else {
            completion(.failure(GlobalError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(GlobalError.decodingError))
                return
            }
            
            if let error = response.error {
                completion(.failure(GlobalError.serverError(error)))
                return
            }
            
            guard let decodedData = response.data else {
                completion(.failure(GlobalError.unknownError))
                return
            }
            
            completion(.success(decodedData))
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
