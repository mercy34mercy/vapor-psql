import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("todos")
            .id()
            .field("title", .string, .required)
            .field("completed", .bool, .required, .custom("DEFAULT FALSE"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("todos").delete()
    }
} 