//
//  ContentView.swift
//  CICD_Pipelines
//
//  Created by Ahex on 22/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            InstagramFeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Reels View")
                .tabItem {
                    Image(systemName: "play.rectangle")
                }
            
            Text("Shop View")
                .tabItem {
                    Image(systemName: "bag")
                }
            
            InstagramProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
