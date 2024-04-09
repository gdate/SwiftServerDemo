//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

/// An example navigation bar, demonstrating how to create reusable components.
struct NavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.png", description: "SwiftServerDemo Logo").frame(width: "300px", height: "100%")) {

//            Link("Ignite on GitHub", target: "https://github.com/twostraws/Ignite")
//
//            Dropdown("@teda") {
//                Link("Twitter", target: "")
//            }
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.light)
        .backgroundColor(.aliceBlue)
        .position(.fixedTop)
    }
}
