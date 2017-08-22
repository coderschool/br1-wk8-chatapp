class Chatroom < ApplicationRecord
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
