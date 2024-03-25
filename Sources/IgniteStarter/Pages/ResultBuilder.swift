//
//  File.swift
//  
//
//  Created by teda on 2024/03/25.
//

import Foundation

import Foundation
import Ignite

struct ResultBuilder: StaticPage {
    var title = "ResultBuilder"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("ResultBuilder")
            .font(.title1)

        Text(markdown: "[do-not-publish](/article/do-not-publish).")
        Text(markdown: "[swift-against-humanity](/article/swift-against-humanity).")
        Text(markdown: "[swift-enterprise-edition](/article/swift-enterprise-edition).")
    }
}
