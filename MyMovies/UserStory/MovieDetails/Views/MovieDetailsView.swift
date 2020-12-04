//
//  MovieDetailsView.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

class MovieDetailsView: UIView {
    
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let posterImageView = UIImageView()
    private let activityIndicator = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        let scrollView = UIScrollView()
        addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        let containerView = UIView()
        scrollView.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
            $0.height.equalToSuperview().priority(.low)
        }
        
        containerView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        containerView.addSubview(yearLabel)
        yearLabel.font = UIFont.systemFont(ofSize: 14)
        yearLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.centerX.equalTo(titleLabel)
        }
        
        containerView.addSubview(posterImageView)
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.snp.makeConstraints {
            $0.top.equalTo(yearLabel.snp.bottom)
            $0.height.equalTo(scrollView.snp.height).multipliedBy(0.6)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(posterImageView.snp.bottom).offset(15)
            $0.bottom.lessThanOrEqualToSuperview().inset(10)
        }
        
        containerView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func updatePoster(with image: UIImage) {
        posterImageView.image = image
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}

extension MovieDetailsView: MovieDetailsRepresentable {
    func update(with movie: MovieDetailsModel) {
        titleLabel.text = movie.originalTitle
        yearLabel.text = movie.releaseDate
        descriptionLabel.text = movie.overview
    }
}
