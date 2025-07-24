//
//  EditPetView.swift
//  Paws
//
//  Created by Samuel Adekunle on 24/07/2025.
//

import Foundation
import SwiftUI
import SwiftData
import PhotosUI

struct EditPetView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var pet: Pet
    @State private var photoPickerItem: PhotosPickerItem?
    
    var body: some View {
        Form {
            // MARK: - IMAGE
            if let imageData = pet.photo {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
                        .padding(.top)
                }
            } else {
                CustomContentAvailableView(
                    icon: "pawprint.circle",
                    title: "No Photo",
                    description: "Add a photo of your favorite pet to make it easier to find them.")
                .padding(.top)
            }
            
            // MARK: - PHOTO PICKER
            PhotosPicker(selection: $photoPickerItem, matching: .images) {
                Label("Select a Photo", systemImage: "photo.badge.plus")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - TEXT FIELD
            TextField("Name", text: $pet.name)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle.weight(.light))
                .padding(.vertical)
            
            // MARK: - BUTTON
            Button {
                dismiss()
            } label: {
                Text("Save")
                    .font(.title3.weight(.medium))
                    .padding(8)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .listRowSeparator(.hidden)
            .padding(.bottom)
            
        } //: FORM
        .listStyle(.plain)
        .navigationTitle("Edit \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onChange(of: photoPickerItem) {
            Task {
                pet.photo = try? await photoPickerItem?.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    NavigationStack {
        do {
            let confirguration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Pet.self, configurations: confirguration)
            let sampleData = Pet(name: "Sammy")
            
            return EditPetView(pet: sampleData)
                .modelContainer(container)
        } catch {
            fatalError("Could not load preview data \(error.localizedDescription)")
        }
    }
}
