import SwiftUI

struct InstagramFeedView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Text("Instagram")
                        .font(.title2)
                        .fontWeight(.bold)
                        .italic()
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Image(systemName: "heart")
                        Image(systemName: "message")
                    }
                    .font(.title3)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Stories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                InstagramStoryView(name: "Your Story", imageName: "profile_picture")
                                InstagramStoryView(name: "nature_hub", imageName: "feed_post_1", isLive: true)
                                InstagramStoryView(name: "foodie", imageName: "feed_post_2")
                                InstagramStoryView(name: "traveler", imageName: "profile_picture")
                                InstagramStoryView(name: "tech_guru", imageName: "feed_post_1")
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        }
                        
                        Divider()
                        
                        // Posts
                        PostView(username: "alex_travels", profileImage: "profile_picture", postImage: "feed_post_1", caption: "Deep work session in the mountains! 🏔️💻 #digitalnomad #workspace")
                        PostView(username: "foodie_delight", profileImage: "feed_post_2", postImage: "feed_post_2", caption: "The best avocado toast in town. 🥑🍞 #foodporn #brunch")
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct PostView: View {
    let username: String
    let profileImage: String
    let postImage: String
    let caption: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Post Header
            HStack {
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                Text(username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 12)
            
            // Post Image
            Image(postImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .clipped()
            
            // Post Actions
            HStack(spacing: 15) {
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .font(.title3)
            .padding(.horizontal, 12)
            
            // Likes
            Text("1,234 likes")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal, 12)
            
            // Caption
            (Text(username).fontWeight(.semibold) + Text(" ") + Text(caption))
                .font(.subheadline)
                .padding(.horizontal, 12)
            
            // Comments
            Text("View all 45 comments")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
            
            Text("2 hours ago")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    InstagramFeedView()
}
