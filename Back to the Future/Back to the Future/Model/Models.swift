//
//  Models.swift
//  Back to the Future
//
//  Created by Jaswitha Reddy G on 2/20/23.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarURL: String?
}

struct GitHubIssue: Codable, Identifiable {
    let title: String?
    let id: UInt32?
    let createdAt: String?
    let body: String?
    let state: String?
    let user: GitHubUser
}
