# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  username        :string           not null
#  img_url         :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :username, :session_token, presence: true, uniqueness: true
  validates :img_url, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :lists,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :List

  has_many :listings,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :Listing

  has_many :spots,
  through: :listings,
  source: :spot

  has_many :received_connections,
  primary_key: :id,
  foreign_key: :user2_id,
  class_name: :Connection

  has_many :sent_connections,
  primary_key: :id,
  foreign_key: :user1_id,
  class_name: :Connection

  has_many :received_users,
  through: :received_connections,
  source: :user1

  has_many :sent_users,
  through: :received_connections,
  source: :user2

  has_many :received_recommendations,
  primary_key: :id,
  foreign_key: :recipient_id,
  class_name: :Recommendation

  has_many :sent_recommendations,
  primary_key: :id,
  foreign_key: :sender_id,
  class_name: :Recommendation

  attr_reader :password

  before_validation :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(name, password)
    @user = User.find_by(email: name)
    @user ||= User.find_by(username: name)
    if @user && @user.is_password?(password)
      return @user
    else
      return nil
    end
  end

  def connected_users
    self.received_users + self.sent_users
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

end
