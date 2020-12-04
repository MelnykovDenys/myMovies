//
//  FavoriteMovieDetailsView.swift
//  MyMovies
//
//  Created by Mac on 03.12.2020.
//

import UIKit

class FavoriteMovieDetailsView: UIView {
    
    private let titleLabel = UILabel()
    private let genreLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
        addSubview(genreLabel)
        genreLabel.numberOfLines = 0
        genreLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension FavoriteMovieDetailsView: MovieDetailsRepresentable {
    func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func update(with movie: MovieDetailsModel) {
        titleLabel.text = movie.title
        genreLabel.text = movie.genres.compactMap( { $0.name } ).joined(separator: ", ") + "\n" + "Budget: ".localized + movie.budget.currency
    }
}
