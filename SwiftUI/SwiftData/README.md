# 📄 SwiftData Cheat Sheet (iOS 17+)

---

## ✅ 1. Define a Model

Use `@Model` on a **class** (not struct!) to make it persistable.

```swift
@Model
class Task {
    var title: String
    var isCompleted: Bool = false
    var createdAt: Date = Date()
}
```

> ⚠️ `@Model` only works with reference types (`class`). You cannot use `struct`.

---

## ✅ 2. Setup in the App Entry Point

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
```

> You can pass multiple models: `.modelContainer(for: [Task.self, User.self])`

---

## ✅ 3. Auto-Fetching Models with `@Query`

```swift
struct TaskListView: View {
    @Query var tasks: [Task] // Auto-refreshes when data changes
    
    var body: some View {
        List(tasks) { task in
            Text(task.title)
        }
    }
}
```

> Supports filtering & sorting:

```swift
@Query(filter: #Predicate<Task> { $0.isCompleted }) var completedTasks: [Task]
```

---

## ✅ 4. Insert, Update, Delete with `ModelContext`

```swift
@Environment(\.modelContext) var context

// Insert
let newTask = Task(title: "Write cheat sheet")
context.insert(newTask)
try? context.save()

// Delete
context.delete(task)
try? context.save()
```

---

## ✅ 5. Use `@Bindable` to Bind to Views

Use `@Bindable` with models inside child views for two-way binding.

```swift
struct TaskEditorView: View {
    @Bindable var task: Task

    var body: some View {
        Toggle("Done", isOn: $task.isCompleted)
    }
}
```

---

## ✅ 6. Model Relationships

```swift
@Model
class Project {
    var name: String
    var tasks: [Task] = []
}

@Model
class Task {
    var title: String
    var project: Project? = nil
}
```

> SwiftData supports 1-to-1, 1-to-many, and many-to-many via object references and arrays.

---

## ✅ 7. Model Configuration

To define configurations, you can use:

```swift
.modelContainer(for: Task.self, configurations: [ModelConfiguration("MyContainer")])
```

This is useful for setting file paths, cloud sync (future), etc.

---

## ✅ 8. Best Practices

| Practice                        | Tip                                   |
| ------------------------------- | ------------------------------------- |
| Use `@Model` classes            | Avoid structs and enums inside models |
| Always save after insert/delete | Use `try? context.save()`             |
| Use `@Query` for reactive lists | It auto-refreshes on changes          |
| Bind models with `@Bindable`    | Best for editing data inside forms    |
| Use relationships smartly       | Keep models lightweight               |

---

## ✅ 9. Useful Imports

```swift
import SwiftUI
import SwiftData
```

---

## ✅ 10. Check iOS Version

> SwiftData is available **only on iOS 17+**

```swift
if #available(iOS 17, *) {
    // Use SwiftData
}
```

---

## 🚀 Quick Reference Summary

| Task           | Code                               |
| -------------- | ---------------------------------- |
| Define model   | `@Model class Name {}`             |
| Save to DB     | `context.insert(obj) + save()`     |
| Fetch models   | `@Query var items: [Model]`        |
| Delete model   | `context.delete(obj)`              |
| Access context | `@Environment(\.modelContext)`     |
| Bind model     | `@Bindable var model: Model`       |
| Create DB      | `.modelContainer(for: Model.self)` |

---
