class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :chats
end
