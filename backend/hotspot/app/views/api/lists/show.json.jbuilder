json.set! @list.id do
  json.id @list.id
  json.ownerId @list.owner_id
  json.title @list.title
  json.publicBoolean @list.public_boolean
  json.queueBoolean @list.queue_boolean
  json.createdAt @list.created_at
  json.updatedAt @list.updated_at
end
