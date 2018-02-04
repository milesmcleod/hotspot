json.set! @spot.id do
  json.id @spot.id
  json.yelpName @spot.yelp_name
  json.createdAt @spot.created_at
  json.updatedAt @spot.updated_at
end
