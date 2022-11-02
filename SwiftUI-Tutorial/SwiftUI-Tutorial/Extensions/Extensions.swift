//
//  Extensions.swift
//  SwiftUI-Tutorial
//
//  Created by TECDATA ENGINEERING on 2/11/22.
//

import SwiftUI

extension Image {
    func imageModifier () -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier () -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}
