import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        req.fileio.streamFile(at: "\(req.application.directory.publicDirectory)index.html")
    }
    
    // Hello Workshop
    app.get("hello", "workshop") { req in
        "Hello Vapor Workshop!"
    }
    
    // Parameters
    app.get("hello", ":name") { req -> String in
        let name = try req.parameters.require("name")
        return "Hello \(name)"
    }
    
    // Returning JSON
    app.get("bottles", ":count") { req -> Bottles in
        let count = try req.parameters.require("count", as: Int.self)
        return Bottles(count: count)
    }
    
    // Accepting JSON
    app.post("bottles") { req -> String in
        let bottles = try req.content.decode(Bottles.self)
        return "There were \(bottles.count) bottles"
    }
    
    // Accept and Return JSON
    app.post("user-info") { req -> UserMessage in
        let userInfo = try req.content.decode(UserInfo.self)
        let message =
        "Hello \(userInfo.name), you are \(userInfo.age)"
        return UserMessage(message: message)
    }
    
    app.get("**") { req -> EventLoopFuture<Response> in
        // パスを取得
        guard let path = req.url.path.removingPercentEncoding?.replacingOccurrences(of: "/", with: "") else {
            throw Abort(.internalServerError)
        }
        
        // パスにindex.htmlを追加
        let indexPath = path + "/index.html"
        
        // index.htmlのファイルパスを作成
        let publicDirectory = app.directory.publicDirectory
        let indexPathInPublic = publicDirectory + indexPath
        
        // ファイルが存在するか確認
        guard FileManager.default.fileExists(atPath: indexPathInPublic) else {
            throw Abort(.notFound)
        }
        
        // index.htmlを返す
        return req.fileio.streamFile(at: indexPathInPublic)
            .encodeResponse(for: req)
    }

    try app.register(collection: UserController())
}

struct Bottles: Content {
    let count: Int
}

struct UserInfo: Content {
    let name: String
    let age: Int
}

struct UserMessage: Content {
    let message: String
}
