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
        Text("Google Cloud Runとは")
            .font(.title1)
        
        Text("Google Cloud RunとはDockerコンテナを使用して、任意の言語やフレームワークで記述されたWebアプリケーションやAPIをパッケージ化し、Googleのインフラストラクチャー上で実行するためのサービスです。")
            .font(.lead)
        Text("今回WebページのデプロイにGoogle Cloud Runを選択した理由は、上述の通りプログラミング言語の制限がないからです。例えば Google Cloud Functions を使用する場合、使用できるランタイムは Node.js、Python、Go、Java、Ruby、PHP、.Net Core です。つまり、Cloud Functions では Swift で実装することができません。")
        Text("また、今回はサーバサイドのWebアプリケーション開発フレームワークであるVaporをつかってSwiftで書いたバックエンドコードをGoogle Cloud Runにデプロイします。")
        Text("全体の流れは以下です。")
        
        List {
            Link("プロジェクトを作成", target: "#step1")
            Link("コマンドラインツールをインストールする", target: "#step2")
            Link("コマンドラインツールを初期化", target: "#step3")
            Link("プロジェクトを設定", target: "#step4")
            Link("Google Cloud Run にデプロイ", target: "#step5")
            
        }.listStyle(.ordered(.default))
        
        Text("プロジェクトを作成").font(.title2).id("step1")
        Text("以下を参考にGoogle Cloudコンソールからプロジェクトを作成")
        Text {
            Link("https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#console", target: "https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#console")
        }
        Text("コマンドラインツールをインストールする").font(.title2).id("step2")
        Text("macユーザーであれば以下リンクからコマンドラインツールを入手")
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
        Text("コマンドラインツールを初期化").font(.title2).id("step3")
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
        Text("Google Cloud Run にデプロイ").font(.title2).id("step5")
        Text("今回はソースから直接デプロイをします。この方法ではソースコードからコンテナイメージが自動的にビルドされて、デプロイされます。")
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
