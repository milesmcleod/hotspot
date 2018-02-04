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
end
