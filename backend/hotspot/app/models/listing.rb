# == Schema Information
#
# Table name: listings
#
#  id         :integer          not null, primary key
#  spot_id    :integer          not null
#  list_id    :integer          not null
#  owner_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Listing < ApplicationRecord

  belongs_to :owner,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :User

  belongs_to :spot,
  primary_key: :id,
  foreign_key: :spot_id,
  class_name: :Spot

  belongs_to :list,
  primary_key: :id,
  foreign_key: :list_id,
  class_name: :List

end
