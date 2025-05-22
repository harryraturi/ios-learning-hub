//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Harish Rathuri on 22/05/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
