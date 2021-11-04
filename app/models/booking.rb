class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_destroy_commit { broadcast_remove_to "bookings" }
end
