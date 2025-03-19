import Fluent
import Vapor

struct TodoController {
    // すべてのTodoを取得
    func index(req: Request) async throws -> [Todo] {
        try await Todo.query(on: req.db).all()
    }
    
    // 特定のTodoを取得
    func show(req: Request) async throws -> Todo {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return todo
    }
    
    // 新しいTodoを作成
    func create(req: Request) async throws -> Todo {
        let todo = try req.content.decode(Todo.self)
        try await todo.save(on: req.db)
        return todo
    }
    
    // Todoを更新
    func update(req: Request) async throws -> Todo {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        let updatedTodo = try req.content.decode(Todo.self)
        todo.title = updatedTodo.title
        todo.completed = updatedTodo.completed
        try await todo.save(on: req.db)
        return todo
    }
    
    // Todoを削除
    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .noContent
    }
} 