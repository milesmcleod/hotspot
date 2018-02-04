json.set! @listing.id do
  json.id @listing.id
  json.spotId @listing.spot_id
  json.listId @listing.list_id
  json.ownerId @listing.owner_id
  json.createdAt @listing.created_at
  json.updatedAt @listing.updated_at
end
