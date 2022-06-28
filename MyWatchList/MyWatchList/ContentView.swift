//
//  ContentView.swift
//  MyWatchList
//
//  Created by Etudiant on 28/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    var appName = "My Watchlist"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(appName)
                .font(.headline)
                .foregroundColor(.gray)
            HStack {
                Text("Aujourd'hui")
                    .font(.title)
                    .bold()
                Spacer()
                Image(systemName: "person.fill")
                    .padding(10)
                    .background(Color.green)
                    .cornerRadius(20)
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                ContentView()
                ContentView().preferredColorScheme(.dark)
            }
    }
}
