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

  belongs_to :owner,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :User

  has_many :listings,
  primary_key: :id,
  foreign_key: :list_id,
  class_name: :Listing

  has_many :spots,
  through: :listings,
  source: :spot

end
