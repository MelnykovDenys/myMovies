//
//  MoviesListTableViewCell.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    
    enum StateActivityIndicator {
        case start
        case stop
    }
    
    static let identifier = String(describing: MoviesListTableViewCell.self)
    
    private let titleLabel = UILabel()
    private let ratingLabel = UILabel()
    private let posterImageView = UIImageView()
    private let starImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        starImageView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        selectionStyle = .blue
        
        contentView.addSubview(posterImageView)
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(10)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(posterImageView.snp.trailing).offset(10)
            $0.top.equalTo(posterImageView)
            $0.trailing.equalToSuperview()
        }
        
        contentView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        contentView.addSubview(starImageView)
        starImageView.isHidden = true
        starImageView.image = UIImage(systemName: Constants.starFillImage)
        starImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(posterImageView)
        }
    }
    
    func configure(with movie: MovieModel, starIsHidden: Bool) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage)".localized
        starImageView.isHidden = starIsHidden
    }
    
    func updatePoster(with image: UIImage) {
        posterImageView.image = image
    }
}
