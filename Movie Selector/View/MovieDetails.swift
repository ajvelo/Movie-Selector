//
//  MovieDetails.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import SwiftUI
import URLImage

struct MovieDetails : View {
    var movie: Movie
    var body: some View {
        VStack {
            URLImage(url: URL(string:  "\(BASE_IMAGE_URL)\(movie.poster_path)")!) {image in
                image.resizable()
                    
                    .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
            }
            HStack {
                Text("Description").foregroundColor(.gray)
                Spacer()
            }
            Text(movie.overview).lineLimit(nil)
            Spacer()
        }.navigationBarTitle(Text(movie.title), displayMode: .inline)
            .padding()
    }
}


struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
