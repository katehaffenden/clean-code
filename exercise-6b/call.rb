# frozen_string_literal: true

# version 1

CITIES = %w[Minsk Berlin].freeze

def call
  CITIES.each do |city|
    return city if address.start_with?(city)
  end
end


# version 2 with strategy pattern

# frozen_string_literal: true

RETURN_CITY_STRATEGIES = [ReturnBerlinStrategy, ReturnMinskStrategy].freeze

# not sure if this method works in it's current state, will city name be returned everytime regardless of the check?
def call
  RETURN_CITY_STRATEGIES.each do |strategy|
    strategy.new.contains?(address).city_name
  end
end

def ReturnBerlinStrategy
  def contains?(address)
    address.include?(city_name)
  end

  def city_name
    'Berlin'
  end
end

def ReturnMinskStrategy
  def contains?(address)
    address.include?(city_name)
  end

  def city_name
    'Minsk'
  end
end

