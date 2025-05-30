//
//  PawsApp.swift
//  Paws
//
//  Created by Harish Rathuri on 22/05/25.
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
