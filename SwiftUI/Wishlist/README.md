# Wishlist App
## 📖 Project Overview

This is a simple **Wishlist App** built using **SwiftUI** and **SwiftData** (Apple’s modern persistence framework introduced in iOS 17). It allows users to:

* Add a new wish via an alert prompt.
* View all stored wishes in a list.
* Swipe to delete wishes.
* See an empty state when there are no wishes.

The app demonstrates key concepts in modern SwiftUI development:

* SwiftData for model persistence.
* Declarative UI using `NavigationStack`, `List`, and `Toolbar`.
* Usage of SwiftUI’s `@Query`, `@Environment(\.modelContext)`, and alerts.

---

## 📁 Project Structure

```
WishlistApp/
│
├── Wish.swift            # Data model using @Model for SwiftData
├── WishlistApp.swift     # App entry point using @main
└── ContentView.swift     # Main UI view to manage and display wishes
```

---

## 📦 Features

* ✅ Create a wish using a `+` button in the toolbar.
* ✅ Persist wishes locally using SwiftData.
* ✅ Delete wishes with swipe-to-delete gestures.
* ✅ Preview modes with both sample data and empty state.

---

## 🧠 Technologies Used

* **SwiftUI** (for UI)
* **SwiftData** (for local persistence)
* **iOS 17+**

---

## 🔩 SwiftData Model

```swift
@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
```

The `@Model` attribute automatically makes this class compatible with SwiftData’s persistence engine. It uses property observation and generates necessary metadata behind the scenes.

---

## 🧑‍💻 How It Works

* The app initializes with a `ContentView` wrapped in a `.modelContainer(for:)`, which injects a SwiftData model context.
* `@Query` automatically fetches and observes the list of `Wish` objects.
* Users can tap the `+` button to open an alert and input a new wish.
* The app shows a dynamic footer displaying the wish count (e.g., "5 wishes").
* When the list is empty, a friendly `ContentUnavailableView` is shown.

---

## 🧪 SwiftUI Previews

### List with Sample Data

```swift
#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Wish(title: "Master SwiftData"))
    ...
    return ContentView().modelContainer(container)
}
```

### Empty List Preview

```swift
#Preview("Empty List") {
    ContentView().modelContainer(for: Wish.self, inMemory: true)
}
```

These previews enable rapid UI iteration without polluting your actual persistent store.

---

## 🚀 Getting Started

1. **Requirements**

   * Xcode 15+
   * iOS 17+

2. **Run the Project**

   * Open the `.xcodeproj` or `.xcodeworkspace`.
   * Run the app on an iOS 17+ simulator or device.

---

## 📌 Future Improvements

* Add wish priorities or tags.
* Enable editing of existing wishes.
* iCloud sync via SwiftData configuration.
* Use a custom model migration strategy.

---
