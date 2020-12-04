//
//  FavoriteMoviesViewController.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
    
    private let contentView = FavoriteMoviesView()
    
    static var movies = [MovieModel]()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        addGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.tableView.reloadData()
    }
    
    @objc func longPress(sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }
        let touchPoint = sender.location(in: contentView.tableView)
        guard let indexPath = contentView.tableView.indexPathForRow(at: touchPoint) else { return }
        let alert = UIAlertController.confirmationAlert(title: "Attention".localized, message: "Are you sure you want to delete the movie?".localized, cancelHandler: nil) { [weak self] _ in
            FavoriteMoviesViewController.movies.remove(at: indexPath.row)
            self?.contentView.tableView.reloadData()
        }
        present(alert, animated: true)
    }
    
    private func addGestureRecognizer() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
        contentView.tableView.addGestureRecognizer(longPress)
    }
}

extension FavoriteMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteMoviesViewController.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMoviesTableViewCell", for: indexPath) as? FavoriteMoviesTableViewCell else {
            return UITableViewCell()
        }
        let movie = FavoriteMoviesViewController.movies[indexPath.row]
        ImageLoader.shared.obtainImageWithPath(imagePath: movie.posterPath ) { image in
            if tableView.cellForRow(at: indexPath) != nil {
                cell.updatePoster(with: image)
            }
        }
        cell.configure(with: movie)
        return cell
    }
}

extension FavoriteMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieID = String(FavoriteMoviesViewController.movies[indexPath.row].id)
        let viewController = MovieDetailsViewController(movieID: movieID, for: .favorite)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
