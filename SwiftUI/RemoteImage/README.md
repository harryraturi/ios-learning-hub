# 🖼️ Load Remote Image in SwiftUI

SwiftUI makes it easy to load images from the internet using `AsyncImage` (available in iOS 15+). This example demonstrates five ways to use `AsyncImage` with different levels of customization.

---

## 📱 Demo Navigation

The main screen provides links to five examples:
1. Basic Image
2. Scaled Image
3. Placeholder Image
4. Phase Handling
5. Animated Transition

Each demonstrates a unique `AsyncImage` capability.

---

## 1️⃣ Basic Usage

```swift
AsyncImage(url: URL(string: imageURL))
```

## 2️⃣ Scaled Image

```swift
AsyncImage(url: URL(string: imageURL), scale: 2.0)
```

## 3️⃣ With Placeholder

```swift
AsyncImage(url: URL(string: imageURL)) { image in
    image.imageModifier()
} placeholder: {
    Image(systemName: "photo.circle.fill").iconModifier()
}
```

## 4️⃣ Handling Load Phases

```swift
AsyncImage(url: URL(string: imageURL)) { phase in
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
```

## 5️⃣ With Animated Transition

```swift
AsyncImage(
    url: URL(string: imageURL),
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
```
