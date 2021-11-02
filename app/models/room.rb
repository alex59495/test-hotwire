class Room < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, :beds, presence: true

  # broadcasts
  # after_create_commit { broadcast_prepend_to('rooms', locals: { current_user: user, room: self }) }
  # after_update_commit { broadcast_replace_to('rooms', locals: { current_user: user, room: self }) }
  after_destroy_commit { broadcast_remove_to "rooms" }
end
