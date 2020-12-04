//
//  MoviesTabBarController.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

class MoviesTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.viewControllers = [moviesListVC, favoriteMoviesVC]
    }
    
    lazy var moviesListVC: UIViewController = {
        let moviesListVC = UIStoryboard(name: Constants.storyboardName, bundle: nil).instantiateViewController(identifier: "MoviesListViewController")
        moviesListVC.tabBarItem = UITabBarItem(title: "Movies".localized, image: UIImage(systemName: Constants.filmImage), selectedImage: UIImage(systemName: Constants.filmFillImage))
        return UINavigationController(rootViewController: moviesListVC)
    }()
    
    lazy var favoriteMoviesVC: UIViewController = {
        let favoriteMoviesVC = UIStoryboard(name: Constants.storyboardName, bundle: nil).instantiateViewController(identifier: "FavoriteMoviesViewController")
        favoriteMoviesVC.tabBarItem = UITabBarItem(title: "Favorites".localized, image: UIImage(systemName: Constants.starImage), selectedImage: UIImage(systemName: Constants.starFillImage))
        return UINavigationController(rootViewController: favoriteMoviesVC)
    }()
}
