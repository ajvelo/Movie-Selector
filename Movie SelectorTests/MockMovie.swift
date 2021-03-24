//
//  MockMovie.swift
//  Movie SelectorTests
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation

@testable import Movie_Selector

extension Movie {
    static func with(id: Int = 49030,
                     popularity: Float = 7.8,
                     voteCount: Int = 4,
                     voteAverage: Float = 4.5,
                     title: String = "Swift MVVM",
                     posterPath: String = "path",
                     originalLanguage: String = "En",
                     originalTitle: String = "Swift MVVM",
                     adult: Bool = false,
                     overView: String = "Overview",
                     releaseDate: String = "2019-12-1T00 20:10:00") -> Movie {
        return Movie(
            popularity: popularity,
            vote_count: voteCount, id: id,
            vote_average: voteAverage,
            title: title,
            poster_path: posterPath,
            original_language: originalTitle,
            original_title: originalTitle,
            adult: adult,
            overview: overView,
            release_date: releaseDate
        )
    }
}
