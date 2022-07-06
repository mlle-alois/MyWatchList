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
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .padding()
        
        ForEach(self.movies) { movie in
            VStack(alignment: .leading) {
                NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                    MovieBackdropCard(movie: movie)
                        .frame(width: 272, height: 200)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 8)
            }.listRowSeparator(.hidden)
        }
    }
}

struct MovieBackdropVerticalCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropVerticalCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
