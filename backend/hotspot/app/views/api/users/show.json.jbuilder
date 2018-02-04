lists = @user.lists.select(&:public_boolean)
spots = []
lists.each do |list|
  spots += list.spots
end

sent_recommendations = @user.sent_recommendations.select do |rec|
  rec.recipient_id = current_user.id
end

received_recommendations = @user.received_recommendations.select do |rec|
  rec.sender_id = current_user.id
end

json.user do
  json.extract! @user, :id, :username, :img_url

  json.lists do
    lists.each do |list|
      spot_ids = []
      list.listings.each do |listing|
        @spot_ids.push(listing.spot_id)
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
    spots.each do |spot|
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
    sent_recommendations.each do |rec|
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
    received_recommendations.each do |rec|
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

end
