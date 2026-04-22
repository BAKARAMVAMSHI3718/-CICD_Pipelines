import SwiftUI

struct InstagramStoryView: View {
    let name: String
    let imageName: String
    var isLive: Bool = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                // Gradient Border
                Circle()
                    .fill(LinearGradient(
                        colors: [.purple, .orange, .yellow],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ))
                    .frame(width: 72, height: 72)
                
                // White background
                Circle()
                    .fill(.white)
                    .frame(width: 68, height: 68)
                
                // Image
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
                if isLive {
                    Text("LIVE")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .background(Color.red)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.white, lineWidth: 2)
                        )
                        .offset(y: 4)
                }
            }
            
            Text(name)
                .font(.caption)
                .lineLimit(1)
                .frame(width: 72)
        }
    }
}

#Preview {
    InstagramStoryView(name: "Your Story", imageName: "profile_picture")
}
