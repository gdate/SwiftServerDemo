//
//  File.swift
//  
//
//  Created by teda on 2024/03/25.
//

import Foundation
import Ignite

struct ResultBuilder: StaticPage {
    var title = "ResultBuilder"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("ResultBuilder")
            .font(.title1)
        
        Text("resultBuilderとはSwift5.4で追加されたアトリビュートの一つです。")
            .font(.lead)
        Text("SwiftのDSL(Domain Specific Language)と言えます。DSLとは特定の問題領域またはタスクに特化したプログラミング言語のことです。")
        
        List {
            Text("コードのブロックを動的に構築して一つの結果を生成します。")
            Text("軽量で読みやすいコードで複雑なオブジェクトを構築できるようになります。")
            Text("例としてSwiftUIのレイアウトを記述する際に使われるViewBuilderなどが挙げられます。")
        }.listStyle(.unordered(.default))
        
        Text("つまり、resultBuilderを用いると可読性・保守性の向上が見込めます。")
        Image("/images/figures/swiftUI.png", description: "swiftUI")
            .resizable()
            .frame(maxWidth: 720)
    }
}
