# Vapor PostgreSQL API

VaporとPostgreSQLを使用した簡単なREST APIのサンプルプロジェクトです。

## 機能

- Todoの作成、読み取り、更新、削除（CRUD）機能を持つRESTful API
- PostgreSQLをデータベースとして使用
- Dockerを使用した簡単な環境セットアップ

## 必要条件

- Swift 5.8以上
- Docker と Docker Compose

## セットアップと実行方法

1. リポジトリをクローン

```bash
git clone <repository-url>
cd vaper-postgres-api
```

2. PostgreSQLをDockerで起動

```bash
docker-compose up -d
```

3. アプリケーションを実行

```bash
swift run
```

サーバーは`http://localhost:8080`で実行されます。

## API エンドポイント

- `GET /api/todos` - すべてのTodoを取得
- `GET /api/todos/:id` - 特定のTodoを取得
- `POST /api/todos` - 新しいTodoを作成
- `PUT /api/todos/:id` - 既存のTodoを更新
- `DELETE /api/todos/:id` - Todoを削除

## リクエスト例

### Todo作成

```bash
curl -X POST http://localhost:8080/api/todos \
  -H "Content-Type: application/json" \
  -d '{"title": "新しいタスク"}'
```

### すべてのTodo取得

```bash
curl http://localhost:8080/api/todos
``` # vapor-psql
