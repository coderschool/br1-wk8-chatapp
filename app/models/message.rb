class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :body, presence: true

  def user_display
    user ? user.email : "Guest"
  end
end
