namespace :update do
  desc "update accomodation_type when nil."
  task :accomodation_type do
    Room.all.each { |room| room.update!(accomodation_type: Accomodation.new(:flat)) if room.accomodation_type.nil? }
  end
  p "Rooms actualized !"
end