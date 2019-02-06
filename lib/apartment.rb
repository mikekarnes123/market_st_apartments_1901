class Apartment
  attr_reader :renter,
              :info
  def initialize(info)
    @info = info
    @renter = nil
  end

  def number
    @info[:number]
  end

  def monthly_rent
    @info[:monthly_rent]
  end

  def bathrooms
    @info[:bathrooms]
  end

  def bedrooms
    @info[:bedrooms]
  end

  def add_renter(renter)
    @renter = renter
  end

end
