import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        req.fileio.streamFile(at: "\(req.application.directory.publicDirectory)index.html")
    }
    
    app.get("**") { req -> EventLoopFuture<Response> in
        // パスを取得
        guard let path = req.url.path.removingPercentEncoding else {
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

    try app.register(collection: TodoController())
}
