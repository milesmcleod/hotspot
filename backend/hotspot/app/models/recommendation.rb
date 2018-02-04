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

  belongs_to :sender,
  primary_key: :id,
  foreign_key: :sender_id,
  class_name: :User

  belongs_to :recipient,
  primary_key: :id,
  foreign_key: :recipient_id,
  class_name: :User

  belongs_to :spot,
  primary_key: :id,
  foreign_key: :spot_id,
  class_name: :Spot

end
