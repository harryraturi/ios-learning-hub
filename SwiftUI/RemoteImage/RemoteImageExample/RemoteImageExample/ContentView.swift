//
//  ContentView.swift
//  RemoteImageExample
//
//  Created by Harish Rathuri on 13/05/25.
//

import SwiftUI

struct ContentView: View {
    // let imageURL = "https://picsum.photos/300"
    let imageURL = "https://farm3.staticflickr.com/2042/2203964933_f1b80a18ba.jpg"
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("1️⃣ Basic Image", destination: BasicImageView(url: imageURL))
                NavigationLink("2️⃣ Scaled Image", destination: ScaledImageView(url: imageURL))
                NavigationLink("3️⃣ Placeholder Example", destination: PlaceholderImageView(url: imageURL))
                NavigationLink("4️⃣ Phase Handling", destination: PhaseHandlingImageView(url: imageURL))
                NavigationLink("5️⃣ Animated Transition", destination: AnimatedImageView(url: imageURL))
            }
            .navigationTitle("Remote Image Styles")
        }
    }
}

// MARK: - 1. Basic AsyncImage
struct BasicImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url))
            .navigationTitle("Basic Image")
    }
}

// MARK: - 2. Scaled AsyncImage
struct ScaledImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url), scale: 2.0)
            .navigationTitle("Scaled Image")
    }
}

// MARK: - 3. With Placeholder
struct PlaceholderImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifier()
        }
        .navigationTitle("With Placeholder")
    }
}

// MARK: - 4. Handling Load Phases
struct PhaseHandlingImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            case .success(let image):
                image.imageModifier()
            case .failure:
                Image(systemName: "ant.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding()
        .navigationTitle("Load Phases")
    }
}

// MARK: - 5. With Animated Transition
struct AnimatedImageView: View {
    let url: String
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6))
        ) { phase in
            switch phase {
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
            case .failure:
                Image(systemName: "ant.circle.fill").iconModifier()
            @unknown default:
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Animated Transition")
    }
}

// MARK: - View Modifiers
extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    func iconModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(.gray)
            .opacity(0.5)
    }
}

#Preview {
    ContentView()
}
