class Accomodation

  attr_reader :key

  def initialize(key)
    @key = key.to_sym
  end

  def type
    TYPES[key]
  end

  def self.load(key)
    # We don't want to build TaxCodes with a nil key
    new(key) if key
  end

  def self.dump(accomodation)
    case accomodation
      when self then accomodation.key
      else accomodation
    end
  end

  def self.all
    TYPES.keys.map{|key| new(key)}
  end

  TYPES = {
    room: 'Room',
    flat: 'Flat',
    house: 'House'
  }

  def ==(other)
    if other.is_a?(self.class)
      key == other.key
    end
  end
end