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
            NavigationView {
                List(githubIssues.openIssues) { issue in
                    NavigationLink(destination: IssueDetailView(issue: issue)) {
                        IssueTabView(state: "open", issue: issue)
                    }
                }
                .navigationBarTitle("Open Issues")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color.orange, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .tabItem {
                Image(systemName: "exclamationmark.triangle.fill")
                Text("Open Issues")
            }
            
            NavigationView {
                List(githubIssues.closedIssues) { issue in
                    NavigationLink(destination: IssueDetailView(issue: issue)) {
                        IssueTabView(state: "closed", issue: issue)
                    }
                }
                .navigationBarTitle("Closed Issues")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color.orange, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .tabItem {
                Image(systemName: "checkmark.circle.fill")
                Text("Closed Issues")
            }
        }
        .accentColor(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(githubIssues: GitHubIssues())
    }
}
