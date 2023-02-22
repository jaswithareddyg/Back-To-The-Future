//
//  IssueDetailView.swift
//  Back to the Future
//
//  Created by Jaswitha Reddy G on 2/20/23.
//

import SwiftUI

struct IssueDetailView: View {
    let issue: GitHubIssue
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: issue.state == "open" ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                        .resizable(capInsets: EdgeInsets())
                        .foregroundColor(issue.state == "open" ? .red : .green)
                        .frame(width: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/)
                        
                    Text(issue.title ?? "No Title")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                }
                
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: issue.user.avatarUrl ?? "No value")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2)
                                .shadow(radius: 2))
                    } placeholder: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("@\(issue.user.login)")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(formatDate(date: issue.createdAt ?? "No Date") ?? "No Date")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                Text("Description")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(/*@START_MENU_TOKEN@*/.bottom, 10.0/*@END_MENU_TOKEN@*/)
                Text(issue.body ?? "No Description")
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
    }
}

struct Previews_IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetailView(issue: GitHubIssue(title: "Hello. This is an open issue.", id: 2434234, createdAt: "2023-01-15T12:15:30Z", body: "Hello, this is the description for an open issue.   Lorem ipsum.", state: "open", user: GitHubUser(login: "hello_hi", avatarUrl: "")))
        IssueDetailView(issue: GitHubIssue(title: "Hello. This is a closed issue.", id: 2434252, createdAt: "2022-10-10T02:51:45Z", body: "Hello, this is the description for a closed issue.   Lorem ipsum.", state: "closed", user: GitHubUser(login: "hello_hi", avatarUrl: "")))
    }
}
