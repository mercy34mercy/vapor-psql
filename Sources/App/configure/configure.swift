import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // データベース設定
    let configuration = PostgresConfiguration(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 5434,
        username: Environment.get("DATABASE_USERNAME") ?? "postgres",
        password: Environment.get("DATABASE_PASSWORD") ?? "postgres",
        database: Environment.get("DATABASE_NAME") ?? "vapor_postgres"
    )
    
    app.databases.use(.postgres(configuration: configuration), as: .psql)

    // マイグレーションの設定
    app.migrations.add(CreateTodo())
    
    // マイグレーションを自動的に実行
    try app.autoMigrate().wait()

    // register routes
    try routes(app)
} 