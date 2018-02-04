# == Schema Information
#
# Table name: recommendations
#
#  id           :integer          not null, primary key
#  sender_id    :integer          not null
#  recipient_id :integer          not null
#  spot_id      :integer          not null
#  content      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Recommendation < ApplicationRecord
end
