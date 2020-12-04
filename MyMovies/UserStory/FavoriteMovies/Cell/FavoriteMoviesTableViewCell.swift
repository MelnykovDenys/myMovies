//
//  FavoriteMoviesTableViewCell.swift
//  MyMovies
//
//  Created by Mac on 03.12.2020.
//

import UIKit

class FavoriteMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with movie: MovieModel) {
        titleLabel.text = movie.title
        yearLabel.text = movie.releaseDate
    }
    
    func updatePoster(with image: UIImage) {
        posterImageView.image = image
    }
}
