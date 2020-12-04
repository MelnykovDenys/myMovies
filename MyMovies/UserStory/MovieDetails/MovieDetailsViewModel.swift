//
//  MovieDetailsViewModel.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation
import UIKit

protocol MovieDetailsViewModelDelegate: class {
    func didFindDetails(movie: MovieDetailsModel)
    func didUpdateImage(with image: UIImage)
    func requestDidFail(with error: Error)
}

class MovieDetailsViewModel {
    
    private let dataService = DataService()
    
    weak var delegate: MovieDetailsViewModelDelegate?
    
    func fetchDetails(with moveId: String) {
        dataService.createRequest(endpoint: .details(moveId: moveId), model: MovieDetailsModel.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movie):
                    self.delegate?.didFindDetails(movie: movie)
                    DispatchQueue.global(qos: .userInitiated).async {
                        guard let backdropPath = movie.posterPath  else { return }
                        ImageLoader.shared.obtainImageWithPath(imagePath: backdropPath) { image in
                            DispatchQueue.main.async {
                                self.delegate?.didUpdateImage(with: image)
                            }
                        }
                    }
                case .failure(let error):
                    self.delegate?.requestDidFail(with: error)
                }
            }
        }
    }
}
