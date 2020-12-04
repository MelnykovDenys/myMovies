//
//  FavoriteMoviesView.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

final class FavoriteMoviesView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        addSubview(tableView)
        tableView.register(UINib(nibName: "FavoriteMoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteMoviesTableViewCell")
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}
