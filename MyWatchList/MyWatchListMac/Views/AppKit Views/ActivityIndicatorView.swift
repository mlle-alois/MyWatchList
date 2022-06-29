//
//  ActivityIndicatorView.swift
//  MyWatchList
//
//  Created by Etudiant on 29/06/2022.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: NSViewRepresentable {
    
    func makeNSView(context: Context) -> NSProgressIndicator {
        let indicator = NSProgressIndicator()
        indicator.style = .spinning
        indicator.startAnimation(nil)
        return indicator
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        
    }
}
