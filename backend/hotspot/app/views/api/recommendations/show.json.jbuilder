json.set! @recommendation.id do
  json.id @recommendation.id
  json.spotId @recommendation.spot_id
  json.content @recommendation.content
  json.senderId @recommendation.sender_id
  json.recipientId @recommendation.recipient_id
  json.createdAt @recommendation.created_at
  json.updatedAt @recommendation.updated_at
end
