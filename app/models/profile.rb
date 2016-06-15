class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :chats
  has_many :comments
end
