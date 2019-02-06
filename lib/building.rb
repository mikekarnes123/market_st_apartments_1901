class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    sum = 0
    @units.each {|unit| sum += unit.info[:monthly_rent]}
    sum / @units.length
  end
end
