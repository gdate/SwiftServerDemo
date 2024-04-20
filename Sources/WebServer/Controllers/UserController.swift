//
//  UserController.swift
//
//
//  Created by teda on 2024/04/20.
//

import Vapor
import Fluent

struct UserController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.post("api", "users", use: createHandler)
        routes.get("api", "users", use: getAllHandler)
        routes.put("api", "users", ":userID", use: updateHandler)
        routes.delete("api", "users", ":userID", use: deleteHandler)
    }
    
    func createHandler(req: Request) async throws -> User {
        let user = try req.content.decode(User.self)
        try await user.save(on: req.db)
        return user
    }
    
    func getAllHandler(req: Request) async throws -> [User] {
        try await User.query(on: req.db).all()
    }
    
    func updateHandler(req: Request) async throws -> User {
        let updatedUser = try req.content.decode(User.self)
        guard let user = try await User.find(req.parameters.get("userID"), on: req.db) else {
            throw Abort(.notFound)
        }
        user.name = updatedUser.name
        user.username = updatedUser.username
        try await user.save(on: req.db)
        return user
    }
    
    func deleteHandler(req: Request) async throws -> HTTPStatus {
        guard let user = try await User.find(req.parameters.get("userID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await user.delete(on: req.db)
        return .ok
    }
}
