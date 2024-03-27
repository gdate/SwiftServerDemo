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
            Text("複数要素の組み合わせ作業を命令的ではなく、宣言的に行えるようにできます。")
            Text("要素を収集し、最終的に一つの結果を出力します。")
            Text("軽量で読みやすいコードで複雑なオブジェクトを構築できるようになります。")
            Text("可読性・保守性の向上が見込めます。")
        }.listStyle(.unordered(.default))
        
        Text("例としてSwiftUIのレイアウトを記述する際に使われるViewBuilderなどが挙げられます。")
        Image("/images/figures/swiftUI.png", description: "swiftUI")
            .resizable()
            .frame(maxWidth: 720)
        
        Text("実装方法")
            .font(.title1)
        Text("Example").font(.title2)
        Text(markdown: "参考: [https://speakerdeck.com/chocoyama/20fen-dewakaru-su-xi-resultbuilder-iosdc-2022](https://speakerdeck.com/chocoyama/20fen-dewakaru-su-xi-resultbuilder-iosdc-2022)")
        Text("Int型の配列をresultBuilderを使って宣言的に記述する").font(.lead)
        
        CodeBlock(language: "swift", """
        var numbers: [Int] {
            [
                1,
                2,
                3
            ]
        }
        """)
        
        Text("適用対象にresultBuilderアノテーションを付与")
        CodeBlock(language: "swift", """
        @resultBuilder
        struct NumberArrayBuilder {
        }
        """)
        
        List {
            Text("buildBlock関数を定義")
            Text("引数として受け取れる型＆返却値の型を指定")
            Text("インプット値をアウトプット値に変換")
        }
        .listStyle(.unordered(.default))
        
        CodeBlock(language: "swift", """
        @resultBuilder
        struct NumberArrayBuilder {
            static func buildBlock(_ components: Int...) -> [Int] {
                components
            }
        }
        """)
        
        Text("作成したresultBuilderをアノテーションでfunc, varなどに付与")
        Text("buildBlockの引数の型に対応した値を列挙")
        CodeBlock(language: "swift", """
        @NumberArrayBuilder
        func makeNumberArray() -> [Int] {
            1
            2
            3
        }
        """)
        
        Text("指定した返却値の方の値が返却される")
        CodeBlock(language: "swift", """
        let numbers = makeNumberArray()
        print(numbers)
        // 出力結果
        // [1, 2, 3]
        """)
        
        Text("buildBlockに任意の処理を挟むこともできる")
        CodeBlock(language: "swift", """
        @resultBuilder
        struct NumberArrayBuilder {
            static func buildBlock(_ components: Int...) -> [Int] {
                components.map { $0 * 2 }
            }
        }
        """)
        CodeBlock(language: "swift", """
        let numbers = makeNumberArray()
        print(numbers)
        // 出力結果
        // [2, 4, 6]
        """)
    }
}
