//
//  ImageLoader.swift
//  MyWatchList
//
//  Created by Etudiant on 29/06/2022.
//

import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false

    func loadImage(with url: URL) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
