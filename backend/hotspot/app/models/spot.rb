# == Schema Information
#
# Table name: spots
#
#  id         :integer          not null, primary key
#  yelp_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Spot < ApplicationRecord

  has_many :listings,
  primary_key: :id,
  foreign_key: :spot_id,
  class_name: :Listing

  has_many :listers,
  through: :listings,
  source: :owner

  has_many :lists,
  through: :listings,
  source: :list

  has_many :recommendations,
  primary_key: :id,
  foreign_key: :spot_id,
  class_name: :Recommendation

  has_many :recommenders,
  through: :recommendations,
  source: :Sender

end
