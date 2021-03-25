//
//  MovieRow.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import SwiftUI
import URLImage

struct MovieRow : View {
    var movie: Movie
    
    var body: some View {
        HStack {
            URLImage(url: URL(string:  "\(Constants.BASE_IMAGE_URL)\(movie.poster_path)")!) { image in
                image.resizable()
                    .frame(width: 90, height: 120)
                
            }
            
            VStack {
                Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text(movie.release_date).foregroundColor(.gray)
                    Spacer()
                    Text("Rate: \(movie.vote_average.format())")
                }
                HStack {
                    Text("Vote count: \(movie.vote_count)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(movie.popularity)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}

extension Float {
    func format() -> String {
        return String(format: "%.2f",self)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
