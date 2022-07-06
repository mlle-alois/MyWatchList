//
//  MovieBackdropCarouselView.swift
//  MyWatchList
//
//  Created by Etudiant on 29/06/2022.
//

import SwiftUI

struct MovieBackdropHorizontalCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MovieBackdropCard(movie: movie)
                                .frame(width: 272, height: 200)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MovieBackdropHorizontalCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropHorizontalCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
