# == Schema Information
#
# Table name: connections
#
#  id              :integer          not null, primary key
#  requester_id    :integer          not null
#  requested_id    :integer          not null
#  pending_boolean :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
