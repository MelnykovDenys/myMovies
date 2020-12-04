//
//  MovieListModel.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation

struct MovieListModel: Codable {
    let createdBy: String
    let description: String
    let favoriteCount: Int
    let id: String
    let items: [MovieModel]
    let itemCount: Int
    let iso: String
    let name: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "created_by"
        case description = "description"
        case favoriteCount = "favorite_count"
        case id = "id"
        case items = "items"
        case itemCount = "item_count"
        case iso = "iso_639_1"
        case name = "name"
        case posterPath = "poster_path"
    }
    
}

struct MovieModel: Codable {
    let title: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let posterPath: String
    let video: Bool
    let voteAverage: Float
    let mediaType: String
    let overview: String
    let releaseDate: String
    let voteCount: Int
    let popularity: Float
    let adult: Bool
    let backdropPath: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case mediaType = "media_type"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case popularity
        case adult
        case backdropPath = "backdrop_path"
    }
}

extension MovieModel: Hashable, Equatable {
    static func == (lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.id == rhs.id
    }
}
