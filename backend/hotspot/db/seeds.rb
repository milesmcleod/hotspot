# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Recommendation.destroy_all
Connection.destroy_all
Listing.destroy_all
List.destroy_all
Spot.destroy_all

IMAGES = [
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-1.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-2.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-3.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-4.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-5.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-6.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-7.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-8.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-9.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-0.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-11.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-12.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-13.png",
  "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-14.png",
]


# USERS

users = []

user1 = User.new(
  username: 'wanda',
  email: 'wanda@gmail.com',
  password: 'password',
  img_url: IMAGES.shuffle[0]
)
user1.save

user2 = User.new(
  username: 'delzano',
  email: 'delzano@gmail.com',
  password: 'password',
  img_url: IMAGES.shuffle[0]
)
user2.save

user3 = User.new(
  username: 'harold',
  email: 'harold@gmail.com',
  password: 'password',
  img_url: IMAGES.shuffle[0]
)
user3.save

user4 = User.new(
  username: '__tangus__',
  email: '__tangus__@gmail.com',
  password: 'password',
  img_url: IMAGES.shuffle[0]
)
user4.save

user5 = User.new(
  username: 'ella',
  email: 'ella@gmail.com',
  password: 'password',
  img_url: IMAGES.shuffle[0]
)
user5.save

# LISTS

users = User.all

users.each do |user|

  list1 = List.new(
    title: 'Food',
    owner_id: user.id,
    public_boolean: true,
    queue_boolean: false
  )
  list1.save

  list2 = List.new(
    title: 'Drinks',
    owner_id: user.id,
    public_boolean: true,
    queue_boolean: false
  )
  list2.save

  list3 = List.new(
    title: 'Secrets',
    owner_id: user.id,
    public_boolean: false,
    queue_boolean: false
  )
  list3.save

end

# SPOTS

spot1 = Spot.new(
  yelp_name: 'gordo-taqueria'
)
spot1.save

spot2 = Spot.new(
  yelp_name: 'cafe-strada'
)
spot2.save

spot3 = Spot.new(
  yelp_name: 'zacharys-pizza'
)
spot3.save

spot4 = Spot.new(
  yelp_name: 'picante-berkeley'
)
spot4.save

spot5 = Spot.new(
  yelp_name: 'agave-uptown-oakland'
)
spot5.save

spot6 = Spot.new(
  yelp_name: 'cheeseboard-berkeley'
)
spot6.save

spot7 = Spot.new(
  yelp_name: 'jupiter-berkeley'
)
spot7.save

spot8 = Spot.new(
  yelp_name: 'spats-berkeley'
)
spot8.save

spot9 = Spot.new(
  yelp_name: 'starline-social-club-oakland'
)
spot9.save

spot10 = Spot.new(
  yelp_name: 'legionaire-oakland'
)
spot10.save

# LISTINGS

Spot.all.each do |spot|
  list_ids = []
  [0, 1, 3, 4, 4, 4, 5, 6, 7].shuffle.pop.times do
    list = List.all.shuffle[0]
    unless list_ids.include?(list.id)
      Listing.create(
        spot_id: spot.id,
        list_id: list.id,
        owner_id: list.owner_id
      )
      list_ids.push(list.id)
    end
  end
end

# CONNECTIONS

users = User.all
i = 0
while i < users.length
  j = i + 1
  while j < users.length
    Connection.create(
      user1_id: users[i].id,
      user2_id: users[j].id
    )
    j += 1
  end
  i += 1
end

# RECOMMENDATIONS

RECS = [
  'nice place good food',
  'make sure you order the fish',
  "don't shy away from the whiskey sour",
  'i always get the tacos',
  'the pizza is the greatest on the planet',
  'you will love the ramen',
  'the owner here is super nice',
  'there is live music on thursdays and you would love it'
]

Connection.all.each do |connection|
  Recommendation.create(
    sender_id: connection.user1_id,
    recipient_id: connection.user2_id,
    spot_id: Spot.all[rand(Spot.all.length)].id,
    content: RECS[rand(RECS.length)]
  )
  Recommendation.create(
    sender_id: connection.user2_id,
    recipient_id: connection.user1_id,
    spot_id: Spot.all[rand(Spot.all.length)].id,
    content: RECS[rand(RECS.length)]
  )
end
