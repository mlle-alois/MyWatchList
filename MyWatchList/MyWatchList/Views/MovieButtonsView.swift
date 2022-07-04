//
//  MovieButtonsView.swift
//  MyWatchList
//
//  Created by Etudiant on 04/07/2022.
//

import SwiftUI

struct MovieButtonsView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.white)
                        
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                        
                }
                Spacer()
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

