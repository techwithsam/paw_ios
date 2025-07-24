//
//  PawsApp.swift
//  Paws
//
//  Created by Samuel Adekunle on 24/07/2025.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
