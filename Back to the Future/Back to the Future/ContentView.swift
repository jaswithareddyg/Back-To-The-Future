//
//  ContentView.swift
//  Back to the Future
//
//  Created by Jaswitha Reddy G on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var githubIssues = GitHubIssues()
    
    var body: some View {
        TabView {
            Text("Open Issues")
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Open Issues")
                }
            Text("Closed Issues")
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Closed Issues")
                }
        }
        .accentColor(.red)
    
    /*var body: some View {
        TabView {
            IssueTabView(state: "open", issues: githubIssues.openIssues)
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Open Issues")
                }
            IssueTabView(state: "closed", issues: githubIssues.closedIssues)
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Closed Issues")
                }
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(githubIssues: GitHubIssues())
    }
}
