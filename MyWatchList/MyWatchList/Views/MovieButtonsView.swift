//
//  MovieButtonsView.swift
//  MyWatchList
//
//  Created by Etudiant on 04/07/2022.
//

import SwiftUI

struct MovieButtonsView: View {
    
    let movie: Movie
    
    @State private var buttonAddBackColor:Color = .white //TODO set right color if in list
    @State private var buttonSeenBackColor:Color = .white //TODO set right color if in list
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    if (self.buttonAddBackColor == .green) {
                        self.buttonAddBackColor = .white
                    } else {
                        self.buttonAddBackColor = .green
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(buttonAddBackColor)
                }
                .shadow(color: .black, radius: 10)
                .buttonStyle(BorderlessButtonStyle())
                
                Button {
                    if (self.buttonSeenBackColor == .green) {
                        self.buttonSeenBackColor = .white
                    } else {
                        self.buttonSeenBackColor = .green
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

