//
//  DataService.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation
import UIKit

class DataService {
    
    static let shared = DataService()
    
    func createRequest<T: Decodable>(endpoint: Endpoint, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.urlWithQuery else { return
            completion(.failure(Errors.request))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                guard let result = try? JSONDecoder().decode(T.self, from: validData) else {
                    completion(.failure(Errors.data))
                    return
                }
                completion(.success(result))
            }
        }.resume()
    }
}

enum Errors: LocalizedError {
    case request
    case data
    
    var errorDescription: String? {
        switch self {
        case .request:
            return "Sorry, the request failed".localized
        case .data:
            return "Sorry, invalid data".localized
        }
    }
}
