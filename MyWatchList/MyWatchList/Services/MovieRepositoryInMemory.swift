//
//  MovieServiceAppStorage.swift
//  MyWatchList
//
//  Created by etudiant on 06/07/2022.
//

import SwiftUI

class MovieRepositoryInMemory {
    
    @AppStorage("seenMovieIds") var seenMovieIds: [Int] = []
    @AppStorage("mustSeeMovieIds") var mustSeeMovieIds: [Int] = []
    static let shared = MovieRepositoryInMemory()
    init() {}
    
    func getAllSeenMovies() -> [Int]{
        return seenMovieIds;
    }
    
    func getAllMustSeeMovies() -> [Int]{
        return mustSeeMovieIds;
    }
    
    func addSeenMovie(seenMovieId: Int) {
        seenMovieIds.append(seenMovieId);
    }
    
    func addMustSeeMovie(mustSeeMovieId: Int) {
        mustSeeMovieIds.append(mustSeeMovieId);
    }
    
    func deleteSeenMovie(seenMovieId: Int) {
        let index = seenMovieIds.firstIndex(of: seenMovieId)
        if let foundIndex = index {
            seenMovieIds.remove(at: foundIndex);
        } else {
            print("Not found")
        }
    }
    
    func deleteMustSeeMovie(mustSeeMovieId: Int) {
        let index = mustSeeMovieIds.firstIndex(of: mustSeeMovieId)
        if let foundIndex = index {
            mustSeeMovieIds.remove(at: foundIndex);
        } else {
            print("Not found")
        }
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

