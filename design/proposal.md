Mango
Bowtie
Mixer
Mixr

#app_name

red, orange, turquoise, and black

## Have you ever made a mixtape for a friend?
A cassette? A CD? A USB stick full of Limewired mp3s?
app_name lets you do just that. But for food. And drinks.

### An app for sharing your favorite places to eat with your friends.
* Keep lists of your favorite restaurants and bars, organized however you want.
* Link to Google Maps and Yelp! to access locations, hours, menus, and contact information.
* Share specific recommendations with members of your network.
* Receive recommendations, and find them in your queue.
* Check out the public lists in your network, so when you visit a new city, you can rely on your local friends' dining expertise, and cross reference it with Yelp! reviews if you like.
* Include personal comments on your recommendations and listed establishments, so you can recommend specific dishes, or remember what you've tried.

## Stack
* MongoDB
  * Mongoose.JS
* Express.JS
* Node.JS
* ReactNative
* Redux

## API integration
* Google Maps
* Yelp!

## Minimum Viable Product
* Sign in with facebook
* Add connections via facebook
* Playlists
  * CRUD for playlist
  * Place restaurants and bars into playlists and remove them
  * Comment on specific listings
  * View other users' public playlists
* Restaurant entities
  * User actions: view, list, share, TAG, comment (when sharing or if listed)
  * Count of total number of users who have listed the establishment
* Recommendations
  * Each user has a recommendation queue
  * Send recommendations to connections and have them appear in queues
  * Option to add message with each recommendation
* Map
  * Show selected personal lists on one map
  * Each user has a map of listed locations; view public lists of other users on map as well
* Search
  * Geographical search for close locations that have been added by you or your network
  * Optional parameters: tags, include (specific) friends, Open Now, price range
* Onboarding walkthrough


When users onboard, there should be several default lists that already exist, and a quick walkthrough that encourages the user to add several restaurants right away.

There should also be an easy way to connect with facebook friends by sending connection requests. Have a text-based invitation that allows you to add friends and/or request for them to join app_name through a single simple text message, as well as through in-app adds.

Find a way to place emphasis equally on sharing and on discovery. This app becomes less fun when no one has recommended anything new and when people stop adding new places to lists.
