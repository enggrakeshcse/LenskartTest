//
//  Movies.swift
//  LenskartTest
//
//  Created by Mac Admin on 29/05/21.
//

import Foundation

struct MoviesResponse
{
    var data: [Movie] = []
    init(_dict: [[String: Any]]) {
        data = _dict.map({Movie(_dict: $0)})
    }
    
}

struct Movie {

    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    init(_dict: [String: Any]) {
        adult = _dict["adult"] as? Bool
        backdropPath = _dict["backdrop_path"] as? String
        genreIds = _dict["genre_ids"] as? [Int]
        id = _dict["id"] as? Int
        originalLanguage = _dict["original_language"] as? String
        originalTitle = _dict["original_title"] as? String
        overview = _dict["overview"] as? String
        popularity = _dict["popularity"] as? Double
        posterPath = _dict["poster_path"] as? String
        releaseDate = _dict["release_date"] as? String
        title = _dict["title"] as? String
        video = _dict["video"] as? Bool
        voteAverage = _dict["vote_average"] as? Double
        voteCount = _dict["vote_count"] as? Int
        
    }

}
