//
//  MovieDetailsModel.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation

struct MovieDetailsModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection : BelongsToCollection?
    let budget: Int
    let genres: [Genres]
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Float?
    let posterPath: String?
    let productionCompanies: [ProductionCompanies]?
    let productionCountries: [ProductionCountries]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages : [SpokenLanguages]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Float?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres = "genres"
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Genres: Codable {
    let id: Int
    let name: String
}

struct ProductionCompanies: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountries: Codable {
    let iso: String?
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case iso = "iso_3166_1"
        case name
    }
}

struct SpokenLanguages: Codable {
    let englishName: String?
    let iso: String?
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso = "iso_639_1"
        case name
    }
}

struct BelongsToCollection: Codable {
    let id : Int?
    let name : String?
    let posterPath : String?
    let backdropPath : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
