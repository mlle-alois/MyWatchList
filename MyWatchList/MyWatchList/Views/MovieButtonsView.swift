//
//  MovieButtonsView.swift
//  MyWatchList
//
//  Created by Etudiant on 04/07/2022.
//

import SwiftUI

struct MovieButtonsView: View {
    
    let movie: Movie
    
    private let movieService: MovieService
    
    @State private var buttonAddBackColor:Color = .white
    @State private var buttonSeenBackColor:Color = .white
    
    init(movie: Movie, movieService: MovieService = MovieServiceAPI.shared) {
        self.movieService = movieService
        self.movie = movie
        if (self.movieService.getAllSeenMovies().contains(movie.id)) {
            self.buttonSeenBackColor = .green
        } else {
            self.buttonSeenBackColor = .white
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    if (self.movieService.getAllMustSeeMovies().contains(movie.id)) {
                        self.buttonAddBackColor = .white
                        self.movieService.deleteMustSeeMovie(mustSeeMovieId: movie.id)
                        print(self.movieService.getAllMustSeeMovies())
                    } else {
                        self.buttonAddBackColor = .green
                        self.movieService.addMustSeeMovie(mustSeeMovieId: movie.id)
                        print(self.movieService.getAllMustSeeMovies())
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(buttonAddBackColor)
                }
                .shadow(color: .black, radius: 10)
                .buttonStyle(BorderlessButtonStyle())
                
                Button {
                    if (self.movieService.getAllSeenMovies().contains(movie.id)) {
                        self.buttonSeenBackColor = .white
                        self.movieService.deleteSeenMovie(seenMovieId: movie.id)
                        print(self.movieService.getAllSeenMovies())
                    } else {
                        self.buttonSeenBackColor = .green
                        self.movieService.addSeenMovie(seenMovieId: movie.id)
                        print(self.movieService.getAllSeenMovies())
                    }
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(buttonSeenBackColor)
                }
                .shadow(color: .black, radius: 10)
                .buttonStyle(BorderlessButtonStyle())
                
            }
            Spacer()
        }.padding(.all, 5)
    }
}

struct MovieButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieButtonsView(movie: Movie.stubbedMovie)
    }
}

