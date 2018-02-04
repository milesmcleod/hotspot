# == Schema Information
#
# Table name: connections
#
#  id         :integer          not null, primary key
#  user1_id   :integer          not null
#  user2_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Connection < ApplicationRecord

  belongs_to :requester,
  primary_key: :id,
  foreign_key: :requester_id,
  class_name: :User

  belongs_to :requested,
  primary_key: :id,
  foreign_key: :requested_id,
  class_name: :User

end
