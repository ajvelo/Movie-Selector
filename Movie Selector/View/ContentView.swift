//
//  ContentView.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation
import SwiftUI

struct ContentView : View {
    @ObservedObject var viewmodel = MovieViewModel()
    @State var currentPage = 1
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if viewmodel.loading {
                    ActivityIndicator(color: Color.blue, size: 50)
                } else {
                    if (viewmodel.movies.results.count > 0) {
                        List(viewmodel.movies.results) { movie in
                            NavigationLink(destination: MovieDetails(movie: movie)){
                                MovieRow(movie: movie).onAppear {
                                    if movie == viewmodel.movies.results.last {
                                        currentPage += 1
                                        self.viewmodel.load(page: currentPage)
                                    }
                                }
                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text("No movies or error")
                        }
                    }
                }
            }
            .onAppear {
                self.viewmodel.load(page: currentPage)
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
