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
end
