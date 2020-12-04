//
//  MoviesListViewModel.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation
import UIKit

protocol MoviesListViewModelDelegate: class {
    func didFindMovies()
    func requestDidFail(with error: Error)
}

class MoviesListViewModel {
    
    private let dataService = DataService()
    weak var delegate: MoviesListViewModelDelegate?
    
    private(set) var movies = [MovieModel]()
    
    func searchList() {
        dataService.createRequest(endpoint: .list(listId: Constants.listId), model: MovieListModel.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.movies = movies.items
                    self.delegate?.didFindMovies()
                case .failure(let error):
                    self.delegate?.requestDidFail(with: error)
                }
            }
        }
    }
}
