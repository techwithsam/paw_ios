//
//  CustomContentAvailableView.swift
//  Paws
//
//  Created by Samuel Adekunle on 24/07/2025.
//

import SwiftUI

struct CustomContentAvailableView: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)
            
            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.tertiary)
    }
}

#Preview {
    CustomContentAvailableView(
        icon: "cat.circle",
        title: "No Photo",
        description: "Add a photo to get started."
    )
}
