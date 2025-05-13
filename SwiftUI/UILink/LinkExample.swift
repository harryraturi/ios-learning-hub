import SwiftUI

struct LinkExample: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "link")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Different Link in Swift UI")
                    .font(.title)
            }
            
            Link("Go to Apple", destination: URL(string: "https://www.apple.com/")!)
                .buttonStyle(.borderless)
            
            Link("Call to Action", destination: URL(string: "tel:91-9000000000")!)
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.regular)
            
            Link("Send an Email", destination: URL(string: "mailto:abc@gmail.com")!)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(.pink)
            
            Link(destination: URL(string: "https://www.apple.com/")!) {
                HStack(spacing: 16) {
                    Image(systemName: "apple.logo")
                    Text("Apple Store")
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background{
                    Capsule()
                        .fill(Color.blue)
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    LinkExample()
}
