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

  def renter_with_highest_rent
    units_w_renters = @units.select {|unit| unit.renter}
    max_rent = units_w_renters.max_by{|unit| unit.info[:monthly_rent]}
    max_rent.renter
  end

  def annual_breakdown
    breakdown = {}
    units_w_renters = @units.select {|unit| unit.renter}
    units_w_renters.each do |unit|
      breakdown[unit.renter.name] = unit.info[:monthly_rent] *12
    end
    breakdown
  end
end
