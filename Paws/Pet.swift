//
//  Pet.swift
//  Paws
//
//  Created by Samuel Adekunle on 24/07/2025.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}

extension Pet {
    @MainActor
    static var preview: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Pet.self, configurations: configuration)
        
        
        container.mainContext.insert(Pet(name: "Belle"))
        container.mainContext.insert(Pet(name: "Sammy"))
        container.mainContext.insert(Pet(name: "Dave"))
        container.mainContext.insert(Pet(name: "Tommy"))
        container.mainContext.insert(Pet(name: "Mide"))
        container.mainContext.insert(Pet(name: "Mision"))
        container.mainContext.insert(Pet(name: "Joyc"))
        container.mainContext.insert(Pet(name: "Tobi"))
        return container
    }
}
