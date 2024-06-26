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
        Include("important.html")
        
        Carousel {
            Slide(background: "https://img.youtube.com/vi/m4yfCS_YBUU/maxresdefault.jpg") {
                Text {
                    Text("テレビアニメ『ちいかわ』PV")
                        .font(.title2)
                    Text("めざましテレビチャンネル")
                        .font(.lead)
                    Link("youtubeで見る", target: "https://www.youtube.com/watch?v=m4yfCS_YBUU")
                        .linkStyle(.button)
                        .role(.danger)
                }
            }
            .backgroundOpacity(0.2)
            Slide(background: "https://img.youtube.com/vi/pbQQAwSQUX4/maxresdefault.jpg") {
                Text {
                    Text("【公式】『ちいかわ』第1話「かためのプリン／ホットケーキ」")
                        .font(.title2)
                    Text("めざましテレビチャンネル")
                        .font(.lead)
                    Link("youtubeで見る", target: "https://www.youtube.com/watch?v=m4yfCS_YBUU")
                        .linkStyle(.button)
                        .role(.danger)
                }
            }
            .backgroundOpacity(0.2)
            Slide(background: "https://img.youtube.com/vi/Oip0JCXcE3w/maxresdefault.jpg") {
                Text {
                    Text("【ちいかわ×アリアナ】アリアナ・グランデ - サンタ・テル・ミー")
                        .font(.title2)
                    Text("めざましテレビチャンネル")
                        .font(.lead)
                    Link("youtubeで見る", target: "https://www.youtube.com/watch?v=m4yfCS_YBUU")
                        .linkStyle(.button)
                        .role(.danger)
                }
            }
            .backgroundOpacity(0.2)
        }
        
        Text("Main Contents")
            .font(.title3)
            .padding()
        
        Section {
            Card(imageName: "/images/logos/resultBuilderLogo.png") {
                Text("resultBuilderとはSwift5.4で追加されたアトリビュートの一つです。")
                
                Link("ResultBuilderについて知る", target: ResultBuilder())
                    .linkStyle(.button)
                    .role(.secondary)
            }
            .frame(maxWidth: 300)
            Card(imageName: "/images/logos/igniteLogo.png") {
                Text("Igniteとは静的サイトジェネレータです。Paul Hudsonによって作られ、try!Swift 2024にて発表されました。")
                
                Link("Igniteについて知る", target: Ignite())
                    .linkStyle(.button)
                    .role(.secondary)
            }
            .frame(maxWidth: 300)
            Card(imageName: "/images/logos/vaporLogo.jpg") {
                Text("VaporとはTanner NelsonとLogan Wrightによって作られたオープンソースWebフレームワークです。")
                
                Link("Vaporについて知る", target: Vapor())
                    .linkStyle(.button)
                    .role(.secondary)
            }
            .frame(maxWidth: 300)
            Card(imageName: "/images/logos/cloudRunLogo.png") {
                Text("このWebサイトを公開してみましょう！")
                
                Link("Cloud Runでデプロイ", target: CloudRun())
                    .linkStyle(.button)
                    .role(.secondary)
            }
            .frame(maxWidth: 300)
        }
    }
}
