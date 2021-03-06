//
//  MovieMustSeeView.swift
//  MyWatchList
//
//  Created by Etudiant on 04/07/2022.
//

import SwiftUI

struct MovieMustSeeView: View {
    
    @ObservedObject private var moviesSeen = MovieListState()
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if let movies = moviesSeen.movies {
                        MovieBackdropVerticalCarouselView(title: "Must see", movies: movies)
                        
                    } else {
                        LoadingView(isLoading: self.moviesSeen.isLoading, error: self.moviesSeen.error) {
                            self.moviesSeen.loadMustSeeMoviesFromAppStorage()
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
            }
        }
        .onAppear {
            self.moviesSeen.loadMustSeeMoviesFromAppStorage()
        }
        
    }
}

struct MovieMustSeeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMustSeeView()
    }
}
