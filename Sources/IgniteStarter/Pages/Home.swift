//
// Home.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Welcome to ExampleSite!")
            .font(.title1)

        Text("This site is a demonstration of a wide variety of Ignite elements and components all in one place, so you can find code samples for your own sites.")
            .font(.lead)

        Text("Key concepts")
            .font(.title2)

        Text("Before you create sites yourself, you should review some key concepts that underpin how Ignite works:")

//        List {
//            Link("Grid Layout", target: GridExamples())
//            Link("Navigation", target: NavigationExamples())
//            Link("Content", target: ContentExamples())
//            Link("Text", target: TextExamples())
//            Link("Styling", target: StylingExamples())
//        }
//        .listStyle(.ordered(.default))
    }
}
