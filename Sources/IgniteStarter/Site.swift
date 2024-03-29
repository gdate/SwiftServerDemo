import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() {
        let site = ExampleSite()

        do {
            try site.publish(buildDirectoryPath: "Public")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {    
    var name = "My Awesome Site"
    var baseTitle = " – My Awesome Site"
    var url = URL("https://www.yoursite.com")

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .python, .ruby]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://www.yoursite.com/images/icon32.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
    var author = "teda"

    var homePage = Home()
    var theme = MyTheme()

    var pages: [any StaticPage] {
        ResultBuilder()
        Ignite()
        Vapor()
    }
}


