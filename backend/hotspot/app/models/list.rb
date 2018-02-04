# == Schema Information
#
# Table name: lists
#
#  id             :integer          not null, primary key
#  owner_id       :integer          not null
#  title          :string           not null
#  public_boolean :boolean          not null
#  queue_boolean  :boolean          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class List < ApplicationRecord
end
