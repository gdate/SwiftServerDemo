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
        Text("ResultBuilderとは")
            .font(.title1)
        
        Text("resultBuilderとはSwift5.4で追加されたアトリビュートの一つです。")
            .font(.lead)
        Text("SwiftのDSL(Domain Specific Language)と言えます。DSLとは特定の問題領域またはタスクに特化したプログラミング言語のことです。")
        
        List {
            Text("要素を収集し、最終的に一つの結果を出力します。")
            Text("軽量で読みやすいコードで複雑なオブジェクトを構築できるようになります。")
            Text("可読性・保守性の向上が見込めます。")
            Text("例としてSwiftUIのレイアウトを記述する際に使われるViewBuilderなどが挙げられます。")
        }.listStyle(.unordered(.default))
        
        Image("/images/figures/swiftUI.png", description: "swiftUI")
            .resizable()
            .frame(maxWidth: 720)
        
        Text("実装方法")
            .font(.title1)
        
    }
}
