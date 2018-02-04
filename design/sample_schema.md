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

## `connections`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `user1_id`          | integer    | not null                       |
| `user2_id`          | integer    | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |

## `lists`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `title`             | string     | not null                       |
| `owner_id`          | integer    | not null, indexed, foreign key |
| `public_boolean`    | boolean    | not null                       |
| `queue_boolean`     | boolean    | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |

## `spots`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `yelp_name`         | string     | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |

## `listings`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `spot_id`           | integer    | not null                       |
| `list_id`           | integer    | not null                       |
| `owner_id`          | integer    | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |

## `recommendations`

| column name         | data type  | details                        |
| ------------------- | ---------- | ------------------------------ |
| `id`                | integer    | not null, primary key          |
| `from_id`           | integer    | not null                       |
| `to_id`             | integer    | not null                       |
| `spot_id`           | integer    | not null                       |
| `content`           | string     | not null                       |
| `created_at`        | datetime   | not null                       |
| `updated_at`        | datetime   | not null                       |
