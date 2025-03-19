import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        return "Vapor-PostgreSQLによるシンプルなAPIサーバーが稼働中です！"
    }

    app.get("hello") { req async -> String in
        return "こんにちは、Vapor！"
    }

    // TodoコントローラーをAPIグループに登録
    let todoController = TodoController()
    let todos = app.grouped("api", "todos")
    todos.get(use: todoController.index)
    todos.post(use: todoController.create)
    todos.group(":todoID") { todo in
        todo.get(use: todoController.show)
        todo.put(use: todoController.update)
        todo.delete(use: todoController.delete)
    }
} 