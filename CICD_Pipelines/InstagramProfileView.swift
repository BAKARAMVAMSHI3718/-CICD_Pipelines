import SwiftUI

struct InstagramProfileView: View {
    let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    HStack {
                        Image("profile_picture")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 25) {
                            ProfileStat(value: "12", label: "Posts")
                            ProfileStat(value: "4.5k", label: "Followers")
                            ProfileStat(value: "382", label: "Following")
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.horizontal)
                    
                    // Bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Alex Johnson")
                            .fontWeight(.bold)
                        Text("Digital Nomad | Nature Lover 🏔️")
                        Text("Building cool stuff with SwiftUI.")
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    
                    // Edit Profile Button
                    Button(action: {}) {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    
                    // Highlights (Simple placeholder)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            HighlightIcon(name: "Travel", icon: "airplane")
                            HighlightIcon(name: "Food", icon: "fork.knife")
                            HighlightIcon(name: "Code", icon: "chevron.left.forwardslash.chevron.right")
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    // Posts Grid
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(0..<12) { index in
                            Image(index % 2 == 0 ? "feed_post_1" : "feed_post_2")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(1, contentMode: .fill)
                                .clipped()
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("alex_j")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
    }
}

struct ProfileStat: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
        }
    }
}

struct HighlightIcon: View {
    let name: String
    let icon: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color(.systemGray6))
                .frame(width: 60, height: 60)
                .overlay(Image(systemName: icon))
            Text(name)
                .font(.caption)
        }
    }
}

#Preview {
    InstagramProfileView()
}
