# GitHub Issues Viewer - Back to the Future (SwiftUI) 🚀

Explore open and closed GitHub Issues in your favorite open-source projects with this SwiftUI-based iOS application. Fetching data through the GitHub REST API and presenting it using SwiftUI views, the app provides a user-friendly interface to keep you informed about the project's ongoing discussions.

This app is the SwiftUI version of [You've Got Issues](https://github.com/jaswithareddyg/You-Have-Got-Issues).

## SwiftUI Views

- ### ContentView
  - Includes a TabView with two tabs: "Open" and "Closed."

- ### IssueTabView
  - Displays a list of issues.
  - Takes a state property to determine whether to display open or closed issues.
  - Displays "Open Issues" or "Closed Issues" in the navigation bar.
  - For each issue, it displays the title, username (prefixed with "@"), and an icon indicating the open/closed state.
  
- ### IssueDetail
  - Displays detailed information for each issue.
  - Shows the issue title, username, formatted date, and description.
  - Uses AsyncImage to load the user's avatar image.
  - Utilizes a ScrollView for scrolling if the content exceeds the screen space.
  
## SwiftUI Previews
- All SwiftUI views have working previews that display sample data, either by making calls to the GitHub client or using fake data.

## Fetching Data
- Utilizes the GitHubIssues code provided to fetch issues from GitHub's API. Injects an instance of the GitHubIssues class into ContentView to access arrays of open and closed issues.

## Attributions

- [Launch Screen in SwiftUI](https://www.appcoda.com/launch-screen-swiftui/)
- [SwiftUI Navigation Bar Color](https://sarunw.com/posts/swiftui-navigation-bar-color/)

## Additional Information

- This project was developed using Xcode and SwiftUI.
- For issues or questions, contact [(Jas) Jaswitha](mailto:jaswithareddyguntaka@gmail.com).

Enjoy exploring GitHub Issues with the GitHub Issues Viewer app! 🌐🔍
