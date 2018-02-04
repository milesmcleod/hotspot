json.currentUser do
  json.extract! @user, :id, :username, :email, :img_url
end

json.lists do
  @user.lists.each do |list|
    spot_ids = []
    list.listings.each do |listing|
      spot_ids.push(listing.spot_id)
    end
    json.set! list.id do
      json.id list.id
      json.title list.title
      json.spotIds spot_ids
      json.publicBoolean list.public_boolean
      json.queueBoolean list.queue_boolean
      json.updatedAt list.updated_at
      json.createdAt list.created_at
    end
  end
end

json.spots do
  @user.spots.each do |spot|
    json.set! spot.id do
      json.id spot.id
      json.yelpName spot.yelp_name
      json.updatedAt spot.updated_at
      json.createdAt spot.created_at
    end
  end
end

json.connections do
  @user.connected_users.each do |user|
    json.set! user.id do
      json.id user.id
      json.username user.username
    end
  end
end

json.pendingConnections do
  @user.pending_connected_users.each do |user|
    json.set! user.id do
      json.id user.id
      json.username user.username
    end
  end
end

json.sentRecommendations do
  @user.sent_recommendations.each do |rec|
    json.set! rec.id do
      json.id rec.id
      json.recipientId rec.recipient_id
      json.spotId rec.spot_id
      json.content rec.content
      json.createdAt rec.created_at
      json.updatedAt rec.updated_at
    end
  end
end

json.receivedRecommendations do
  @user.received_recommendations.each do |rec|
    json.set! rec.id do
      json.id rec.id
      json.senderId rec.sender_id
      json.spotId rec.spot_id
      json.content rec.content
      json.createdAt rec.created_at
      json.updatedAt rec.updated_at
    end
  end
end
