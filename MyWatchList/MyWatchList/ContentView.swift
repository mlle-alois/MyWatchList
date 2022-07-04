//
//  ContentView.swift
//  MyWatchList
//
//  Created by Etudiant on 29/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(1)
            
            MovieSeenView()
                .tabItem {
                    VStack {
                        Image(systemName: "checkmark")
                        Text("Seen")
                    }
            }
            .tag(2)
            
            MovieMustSeeView()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("Must see")
                    }
            }
            .tag(3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
