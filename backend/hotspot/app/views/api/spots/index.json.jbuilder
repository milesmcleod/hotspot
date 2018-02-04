json.spots do
  @spots.each do |spot|
    json.set! spot.id do
      json.yelpName spot.yelp_name
    end
  end
end
