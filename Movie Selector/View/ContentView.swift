//
//  ContentView.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation
import SwiftUI

struct ContentView : View {
    @ObservedObject var viewmodel = MovieViewModel(service: APIService())
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if viewmodel.loading {
                    ActivityIndicator(color: Color.blue, size: 50)
                } else {
                    if (viewmodel.movies.results.count > 0) {
                        List(viewmodel.movies.results) { movie in
                            Text(movie.title)
//                            NavigationLink(destination: MovieDetails(movie: movie)){
//                                MovieRow(movie: movie)
//                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text("No movies or error")
                        }
                    }
                }
            }
            .onAppear {
                self.viewmodel.loadData()
            }
            .navigationBarTitle(Text("Movies"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
