json.set! @connection.id do
  json.id @connection.id
  json.requesterId @connection.requester_id
  json.requestedId @connection.requested_id
  json.pendingBoolean @connection.pending_boolean
  json.createdAt @connection.created_at
  json.updatedAt @connection.updated_at
end
