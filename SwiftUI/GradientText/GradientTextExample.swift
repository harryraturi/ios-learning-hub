import SwiftUI

struct GradientTextExample: View {
    var body: some View {
        VStack {
            
            Text("iOS Dev")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Gradient Mask")
                .font(.system(size: 40, weight: .bold))
                .overlay(
                    LinearGradient(
                        colors: [.red, .orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .mask(
                    Text("Gradient Mask")
                        .font(.system(size: 40, weight: .bold))
                )
        }
        .padding()
    }
}

#Preview {
    GradientTextExample()
}
