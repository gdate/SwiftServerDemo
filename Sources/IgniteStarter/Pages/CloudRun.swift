//
//  CloudRun.swift
//
//
//  Created by teda on 2024/04/02.
//

import Foundation
import Ignite

struct CloudRun: StaticPage {
    var title = "CloudRun"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Cloud Runとは")
            .font(.title1)
        
        Text("Cloud Runとはコンテナを使用して、任意の言語やフレームワークで記述されたWebアプリケーションやAPIを簡単にデプロイできるようにするものです。")
            .font(.lead)
        Text("今回はサーバサイドのWebアプリケーション開発フレームワークであるVaporをつかってSwiftで書いたバックエンドコードをCloud Runにデプロイします。")
        Text("全体の流れは以下です。")
        
        List {
            Link("プロジェクトを作成", target: "#step1")
            Link("gcloud CLI をインストールする", target: "#step2")
            Link("gcloud CLI を初期化", target: "#step3")
            Link("プロジェクトを設定", target: "#step4")
            Link("ソースから Cloud Run にデプロイ", target: "#step5")
            
        }.listStyle(.ordered(.default))
        
        Text("プロジェクトを作成").font(.title2).id("step1")
        Text("以下を参考にGoogle Cloudコンソールからプロジェクトを作成")
        Text {
            Link("https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#console", target: "https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#console")
        }
        Text("gcloud CLI をインストールする").font(.title2).id("step2")
        Text("macユーザーであれば以下リンクからCLIを入手")
        Text {
            Link("https://cloud.google.com/sdk/docs/install?hl=ja#mac", target: "https://cloud.google.com/sdk/docs/install?hl=ja#mac")
        }
        Text("インストールディレクトリに移動してインストールスクリプトを実行")
        CodeBlock(language: "shell",
        """
        $ ./install.sh
        """)
        Text("途中でPATHを通すか聞いてくるので通す")
        CodeBlock(language: "shell", """
        Modify profile to update your $PATH and enable shell command completion?

        Do you want to continue (Y/n)?  y
        """)
        Text("gcloud CLI を初期化").font(.title2).id("step3")
        CodeBlock(language: "shell", """
        $ gcloud init
        """)
        Text("ログインを求められるので、出力されたURLをブラウザに貼り付けてログイン")
        CodeBlock(language: "shell", """
        You must log in to continue. Would you like to log in (Y/n)?  y

        Your browser has been opened to visit:
        
            https://accounts.google.com/o/oauth2/auth?response_type=code&xxxxxxxx
        """)
        Text("プロジェクトを設定").font(.title2).id("step4")
        CodeBlock(language: "shell", """
        $ gcloud config set project {PROJECT_ID}
        """)
        Text("確認")
        CodeBlock(language: "shell", """
        $ gcloud config list
        [core]
        account = xxx
        disable_usage_reporting = True
        project = xxx
        """)
        Text("ソースから Cloud Run にデプロイ").font(.title2).id("step5")
        CodeBlock(language: "shell", """
        // プロジェクトのルートディレクトリ
        $ gcloud run deploy
        """)
        Text("ビルドに足りないAPIを有効にするか聞いてくるので、有効にする")
        CodeBlock(language: "shell", """
        Service name (xxx):
        The following APIs are not enabled on project {PROJECT_ID}:
                artifactregistry.googleapis.com
                cloudbuild.googleapis.com
                run.googleapis.com

        Do you want enable these APIs to continue (this will take a few minutes)? (y/N)?
          y

        """)
        Text("続いてCloud Runを稼働させるリージョンが聞かれるのでasia-northeast1などを選択")
        CodeBlock(language: "shell", """
        Please specify a region:
         [1] africa-south1
         [2] asia-east1
         [3] asia-east2
         [4] asia-northeast1
         [5] asia-northeast2
         [6] asia-northeast3
         ...
        Please enter numeric choice or text value (must exactly match list item):  4
        """)
        Text("最後にサービスを公開するかを聞かれるのでYes")
        CodeBlock(language: "shell", """
        Allow unauthenticated invocations to [swiftserverdemo] (y/N)?  y
        """)
        Text("サービスのURLが発行するのでアクセスする")
        CodeBlock(language: "shell", """
        Done.
        Service [xxx] revision [xxx] has been deployed and is serving 100 percent of traffic.
        Service URL: https://xxx.a.run.app
        """)
    }
}
