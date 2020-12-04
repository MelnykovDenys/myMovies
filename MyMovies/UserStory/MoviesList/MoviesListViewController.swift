//
//  MoviesListViewController.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

final class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MoviesListTableViewCell.self, forCellReuseIdentifier: MoviesListTableViewCell.identifier)
        viewModel.delegate = self
        viewModel.searchList()
        addGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func longPress(sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }
        let touchPoint = sender.location(in: tableView)
        guard let indexPath = tableView.indexPathForRow(at: touchPoint) else { return }
        let selectedMovie = viewModel.movies[indexPath.row]
        guard !FavoriteMoviesViewController.movies.contains(selectedMovie) else { return }
        FavoriteMoviesViewController.movies.append(selectedMovie)
        tableView.reloadData()
    }
    
    private func addGestureRecognizer() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
        tableView.addGestureRecognizer(longPress)
    }
    
    private func showAlert(with error: String) {
        let alert = UIAlertController.errorAlert(with: error)
        present(alert, animated: true)
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListTableViewCell.identifier) as? MoviesListTableViewCell else {
            return UITableViewCell()
        }
        let movie = viewModel.movies[indexPath.row]
        ImageLoader.shared.obtainImageWithPath(imagePath: movie.posterPath ) { image in
            if tableView.cellForRow(at: indexPath) != nil {
                cell.updatePoster(with: image)
            }
        }
        cell.configure(with: movie, starIsHidden: !FavoriteMoviesViewController.movies.contains(movie))
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieID = String(viewModel.movies[indexPath.row].id)
        let viewController = MovieDetailsViewController(movieID: movieID, for: .main)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MoviesListViewController: MoviesListViewModelDelegate {
    func requestDidFail(with error: Error) {
        showAlert(with: error.localizedDescription)
    }
    
    func didFindMovies() {
        tableView.reloadData()
    }
}
