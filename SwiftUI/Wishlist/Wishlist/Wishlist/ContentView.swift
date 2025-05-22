//
//  ContentView.swift
//  Wishlist
//
//  Created by Harish Rathuri on 22/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            } //: LIST
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing, actions: {
                TextField("Enter a wish", text: $title)
                
                Button {
                    Task {
                        modelContext.insert(Wish(title: title))
                        title = ""
                    }
                } label: {
                    Text("Save")
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
                Button("Cancel", role: .cancel) {
                    title = ""
                }
            })
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet, Add one to get started."))
                }
            }
        } //: NAVIGATIONSTACK
    } //: BODY
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    Task {
        container.mainContext.insert(Wish(title: "Master SwiftData"))
        container.mainContext.insert(Wish(title: "Buy new iPhone"))
        container.mainContext.insert(Wish(title: "Practice latin dances"))
        container.mainContext.insert(Wish(title: "Travel to UAE"))
        container.mainContext.insert(Wish(title: "Make a positive impact"))
    }
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
