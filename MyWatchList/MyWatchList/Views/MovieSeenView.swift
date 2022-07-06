//
//  MovieSeenView.swift
//  MyWatchList
//
//  Created by Etudiant on 04/07/2022.
//

import SwiftUI

struct MovieSeenView: View {
    
    @ObservedObject private var moviesSeen = MovieListState()
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if moviesSeen.movies != nil {
                        MovieBackdropVerticalCarouselView(title: "Seen", movies: moviesSeen.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.moviesSeen.isLoading, error: self.moviesSeen.error) {
                            self.moviesSeen.loadSeenMoviesFromAppStorage()
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
            }
        }
        .onAppear {
            self.moviesSeen.loadSeenMoviesFromAppStorage()
        }
        
    }
}

struct MovieSeenView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSeenView()
    }
}
