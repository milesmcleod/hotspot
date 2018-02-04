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
end
