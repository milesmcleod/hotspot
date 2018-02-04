json.set! @connection.id do
  json.id @connection.id
  json.user1Id @connection.user1_id
  json.user2Id @connection.user2_id
  json.createdAt @connection.created_at
  json.updatedAt @connection.updated_at
end
