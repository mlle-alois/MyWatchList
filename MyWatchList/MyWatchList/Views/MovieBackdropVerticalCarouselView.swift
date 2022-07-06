//
//  MovieBackdropVerticalCarouselView.swift
//  MyWatchList
//
//  Created by Etudiant on 04/07/2022.
//

import SwiftUI

struct MovieBackdropVerticalCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.horizontal) {
                VStack(alignment: .center, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MovieBackdropCard(movie: movie)
                                .frame(width: 272, height: 200)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MovieBackdropVerticalCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropVerticalCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
