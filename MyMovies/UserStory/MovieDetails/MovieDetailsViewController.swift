//
//  MovieDetailsViewController.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

protocol MovieDetailsRepresentable: UIView {
    func update(with movie: MovieDetailsModel)
    func updatePoster(with image: UIImage)
    func startActivityIndicator()
    func stopActivityIndicator()
}

extension MovieDetailsRepresentable {
    func updatePoster(with image: UIImage) { }
}

class MovieDetailsViewController: UIViewController {
    
    enum Details {
        case main
        case favorite
    }
    
    private let contentView: MovieDetailsRepresentable
    private let viewModel = MovieDetailsViewModel()
    private let movieID: String
    private let details: Details
    
    init(movieID: String, for details: Details) {
        self.movieID = movieID
        self.details = details
        self.contentView = details == .main ? MovieDetailsView() : FavoriteMovieDetailsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchDetails(with: movieID)
        contentView.startActivityIndicator()
    }
    
    private func showAlert(with error: String) {
        let alert = UIAlertController.errorAlert(with: error)
        present(alert, animated: true)
    }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func didUpdateImage(with image: UIImage) {
        contentView.updatePoster(with: image)
    }
    
    func didFindDetails(movie: MovieDetailsModel) {
        contentView.stopActivityIndicator()
        contentView.update(with: movie)
    }
    
    func requestDidFail(with error: Error) {
        contentView.stopActivityIndicator()
        showAlert(with: error.localizedDescription)
    }
}
