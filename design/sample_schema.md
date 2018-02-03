# Database Schema

## `users`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `email`             | string     | not null, indexed, unique      |
| `username`          | string     | not null, indexed, unique      |
| `img_url`           | string     | not null                       |
| `password_digest`   | string     | not null                       |
| `session_token`     | string     | not null, indexed, unique      |
| `created_at`        | datetime   | not null                       |  
| `updated_at`        | datetime   | not null                       |  

## `lists`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `title`             | string     | not null                       |
| `owner_id`          | integer    | not null, indexed, foreign key |
| `public_boolean`    | boolean    | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |

## `spots`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `name`              | string     | not null                       |
| `yelp_url`          | string?    | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |
