//
//  APIs.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation

enum Endpoint {
    case list(listId: String)
    case details(moveId: String)
    
    private var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    
    private var urlWithPath: String {
        switch self {
        case .list(let listId):
            return "\(baseURL)/list/\(listId)"
        case .details(let moveId):
            return "\(baseURL)/movie/\(moveId)"
        }
    }
    
    var urlWithQuery: URL? {
        var components = URLComponents(string: urlWithPath)
        components?.queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey),
                                  URLQueryItem(name: "language", value: "en-US")]
        return components?.url
    }
}

