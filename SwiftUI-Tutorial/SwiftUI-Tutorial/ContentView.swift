//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by TECDATA ENGINEERING on 2/11/22.
//

import SwiftUI

struct ContentView: View {
    
    private let imageURl = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // MARK: - 1 BASIC
        
        //AsyncImage(url: URL(string: imageURl))
        
        // MARK: - 2 SCALE
        
        // AsyncImage(url: URL(string: imageURl), scale: 3.0)
        
        // MARK: - 3 PLACEHOLDER
        
        /*
         AsyncImage(url: URL(string: imageURl)) { image in
            image
                .imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifier()
        }
        .padding(40)
         */
        
        // MARK: - 4 PHASE
        /*
        AsyncImage(url: URL(string: imageURl)) { phase in
            // SUCCESS -> The image successfully loaded
            // FAILURA -> The image failed to load with an error
            // EMPTY -> No image is loaded
            
            if let imageUnw = phase.image {
                imageUnw.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill")
                    .iconModifier()
            } else {
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            }
        }.padding(40)
         */
        
        // MARK: - 5 ANIMATIONS
        
        AsyncImage(url: URL(string: imageURl),
                   transaction: Transaction(animation: .spring(response: 0.5,
                                                               dampingFraction: 0.6,
                                                               blendDuration: 0.25))) { phase in
            switch phase{
            case.success(let image):
                image.imageModifier()
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }.padding(40)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
