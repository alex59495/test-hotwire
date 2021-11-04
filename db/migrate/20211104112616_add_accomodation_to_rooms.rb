class AddAccomodationToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :accomodation_type, :string
  end
end
