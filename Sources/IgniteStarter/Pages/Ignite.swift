//
//  File.swift
//  
//
//  Created by teda on 2024/03/26.
//

import Foundation
import Ignite

struct Ignite: StaticPage {
    var title = "Ignite"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Igniteとは")
            .font(.title1)
        
        Text(markdown: """
        Igniteとは静的サイトジェネレータです。[Paul Hudson](https://twitter.com/twostraws)によって作られ、try!Swift 2024にて発表されました。
        """).font(.lead)
        
        Text("Igniteは、SwiftUIコードをHTMLに変換しようとしたり、単にHTMLタグをSwiftコードにマッピングしようとすることはありません。代わりに、HTMLやCSSの知識がなくても、SwiftUIに似た構文を使用して素晴らしいウェブサイトを構築するのを手助けすることを目指しています。")
        
        Text("ResultBuilderによってHTMLやCSSの記述をSwiftUIのような構文に置き換え、結果として得られたHTMLやCSSをWebページに必要な構成要素を含んだものをBuildフォルダに出力します。")
        
        Text {
            Link("Ignite on GitHub", target: "https://github.com/twostraws/Ignite")
                .linkStyle(.button)
                .role(.secondary)
        }
        
        Text("Example")
            .font(.title2)
        
        Text("以下のようにSwiftUIの要領で記述できます。")
            .font(.lead)
        
        CodeBlock(language: "swift", """
        Text {
            Text("Swift rocks")
                .font(.title1)        
            Text(markdown: "Add *inline* Markdown")
                .foregroundStyle(.secondary)
            Link("Swift", target: "https://www.swift.org")
                .linkStyle(.button)
            Divider()
            Image("/images/Swift_logo_color.svg")
                .accessibilityLabel("The Swift logo.")
                .padding()
        }
        """)
        
        Image("/images/figures/codeExample.png")
            .accessibilityLabel("Ignite Code Example")
            .frame(maxWidth: 720)
        
        Text("より詳しい情報を知りたい場合は以下のサンプルサイトを参照ください。")
        Text { Link("https://ignitesamples.hackingwithswift.com", target: "https://ignitesamples.hackingwithswift.com") }
    }
}
