import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        req.fileio.streamFile(at: "\(req.application.directory.publicDirectory)index.html")
    }

    try app.register(collection: TodoController())
}
