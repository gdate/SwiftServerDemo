//
//  File.swift
//  
//
//  Created by teda on 2024/03/26.
//

import Foundation
import Ignite

struct Vapor: StaticPage {
    var title = "Vapor"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("What is Vapor?")
            .font(.title1)
        
        Text("VaporとはTanner NelsonとLogan Wrightによって作られたオープンソースWebフレームワークです。")
            .font(.lead)
        Text("Swiftでバックエンド、ウェブアプリのAPI、HTTP サーバーを書くことができます。最新のSwift機能とAPIを利用できます。")
        
        Image("/images/figures/Vapor.png", description: "swiftUI")
            .frame(maxWidth: 720)
        Text {
            Link("https://static.brokenhands.io/training/SwiftConnection-Vapor.pdf", target: "https://static.brokenhands.io/training/SwiftConnection-Vapor.pdf")
        }
        
        Text("Fluent").font(.title2)
        Text("FluentはVaporのORMライブラリであり、データベースとの対話を簡素化します。Fluentを使用すると、モデルオブジェクトをデータベースの行にマッピングし、CRUD（Create、Read、Update、Delete）操作を行うことができます。")
        Text("HTTP").font(.title2)
        Text("HTTPモジュールには、ルーター、ミドルウェア、コントローラーなどが含まれており、これらを使用してHTTPリクエストを受け取り、処理し、適切なレスポンスを返すことができます。")
        Text("Leaf").font(.title2)
        Text("LeafはVaporのテンプレートエンジンであり、動的なHTMLやその他のコンテンツを生成するために使用されます。")
        
        Text("Why Vapor?")
            .font(.title1)
        List {
            Text("Xcodeでのデバッグサポートが受けられる")
            Text("非同期処理(async/await)とノンブロッキングな特性により高いRPSを実現でき、サーバ台数を減らせる可能性が高い")
            Text("少ないメモリリソースで多くのリクエストを処理できる")
            Text("Swiftを使っているので型安全")
        }
    }
}

