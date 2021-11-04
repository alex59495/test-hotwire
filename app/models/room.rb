class Room < ApplicationRecord
  has_many :bookings
  belongs_to :user

  serialize :accomodation_type, Accomodation

  validates :name, :beds, presence: true

  validates :accomodation_type, inclusion: { in: Accomodation.all }

  # broadcasts
  # after_create_commit { broadcast_prepend_to('rooms', locals: { current_user: user, room: self }) }
  # after_update_commit { broadcast_replace_to('rooms', locals: { current_user: user, room: self }) }
  after_destroy_commit { broadcast_remove_to "rooms" }

  def accomodation
    accomodation_type.type if accomodation_type
  end
end
