//
//  MovieListState.swift
//  MyWatchList
//
//  Created by Etudiant on 29/06/2022.
//

import SwiftUI

class MovieListState: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    init(movieService: MovieService = MovieServiceAPI.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.isLoading = true
        self.movieService.getMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    func loadSeenMoviesFromAppStorage() {
        self.movies = []
        self.isLoading = true
        self.movieService.getAllSeenMovies().forEach({ id in
            self.movieService.getMovie(id: id) {[weak self] (result) in
                guard let self = self else { return }
                
                self.isLoading = false
                switch result {
                case .success(let movie):
                    self.movies?.append(movie)
                case .failure(let error):
                    self.error = error as NSError
                }
            }
        })
    }
    
    func loadMustSeeMoviesFromAppStorage() {
        self.movies = []
        self.isLoading = true
        self.movieService.getAllMustSeeMovies().forEach({ id in
            self.movieService.getMovie(id: id) {[weak self] (result) in
                guard let self = self else { return }
                
                self.isLoading = false
                switch result {
                case .success(let movie):
                    self.movies?.append(movie)
                case .failure(let error):
                    self.error = error as NSError
                }
            }
        })
    }
    
}

