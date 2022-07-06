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
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    if (self.movieService.getAllMustSeeMovies().contains(movie.id)) {
                        self.buttonAddBackColor = .white
                        self.movieService.deleteMustSeeMovie(mustSeeMovieId: movie.id)
                    } else {
                        self.buttonAddBackColor = .green
                        self.movieService.addMustSeeMovie(mustSeeMovieId: movie.id)
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
                    } else {
                        self.buttonSeenBackColor = .green
                        self.movieService.addSeenMovie(seenMovieId: movie.id)
                    }
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(buttonSeenBackColor)
                }
                .shadow(color: .black, radius: 10)
                .buttonStyle(BorderlessButtonStyle())
                
            }
            Spacer()
        }
        .padding(.all, 5)
        .onAppear {
            if (self.movieService.getAllSeenMovies().contains(movie.id)) {
                self.buttonSeenBackColor = .green
            } else {
                self.buttonSeenBackColor = .white
            }
            
            if (self.movieService.getAllMustSeeMovies().contains(movie.id)) {
                self.buttonAddBackColor = .green
            } else {
                self.buttonAddBackColor = .white
            }
        }
    }
}

struct MovieButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieButtonsView(movie: Movie.stubbedMovie)
    }
}

