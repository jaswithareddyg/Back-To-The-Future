//
//  GithubClient.swift
//  Back to the Future
//
//  Created by Jaswitha Reddy G on 2/20/23.
//

import Foundation

class GitHubIssues: ObservableObject {
    @Published var openIssues: [GitHubIssue] = []
    @Published var closedIssues: [GitHubIssue] = []
    
    init() {
        let url = URL(string: "https://api.github.com/repos/AUTOMATIC1111/stable-diffusion-webui/issues?state=all")!
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in guard let data = data, error == nil else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let issues = try? decoder.decode([GitHubIssue].self, from: data)
            
            DispatchQueue.main.async {
                if let issues = issues {
                    self.openIssues = issues.filter({$0.state == "open"})
                    print(self.openIssues)
                    self.closedIssues = issues.filter({$0.state == "closed"})
                }
            }
        }
        task.resume()
    }
}

func formatDate(date: String) -> String? {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd, yyyy"
    
    if let curdate = dateFormatterGet.date(from: date) {
        return dateFormatterPrint.string(from: curdate)
    }
    else {
        return nil
    }
}
