import NIOSSL
import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
//    let directory = DirectoryConfiguration.detect()
//    app.directory = directory
//    app.directory.publicDirectory = "Build/"
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory, defaultFile: "index.html"))
    
    app.databases.use(DatabaseConfigurationFactory.sqlite(.file("db.sqlite")), as: .sqlite)
    
    app.migrations.add(CreateUser())
    try await app.autoMigrate()
    // register routes
    try routes(app)
}
