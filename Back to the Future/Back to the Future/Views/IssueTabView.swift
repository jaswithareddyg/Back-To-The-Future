//
//  IssueTabView.swift
//  Back to the Future
//
//  Created by Jaswitha Reddy G on 2/20/23.
//

import SwiftUI

struct IssueTabView: View {
    
    let state: String
    let issue: GitHubIssue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: state == "open" ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(state == "open" ? .red : .green)
                    .frame(width: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                Text(issue.title ?? "No Title")
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.bottom, 2) 
            }
            Text("@\(issue.user.login)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

struct Previews_IssueTabView_Previews: PreviewProvider {
    static var previews: some View {
        IssueTabView(state: "open", issue: GitHubIssue(title: "Hello. This is an open issue.", id: 2434234, createdAt: "2023-01-15T12:15:30Z", body: "Hello, this is the description.   Lorem ipsum.", state: "open", user: GitHubUser(login: "hello_hi", avatarUrl: "")))
        IssueTabView(state: "closed", issue: GitHubIssue(title: "Hello. This is a closed issue.", id: 2434252, createdAt: "2022-10-10T02:51:45Z", body: "Hello, this is the description.   Lorem ipsum.", state: "closed", user: GitHubUser(login: "hello_hi", avatarUrl: "")))
    }
}
