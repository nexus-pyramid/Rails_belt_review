class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
 validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
 validates :First_name, presence: true
 validates :Last_name, presence: true
 validates :password, presence: true, length: {minimum: 6}, on: :create
 has_many :events
 has_many :guests, dependent: :destroy
 has_many :comments
 has_many :events_joined, through: :guests, source: :event
end
