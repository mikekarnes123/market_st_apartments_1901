require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/building'
require './lib/renter'


class BuildingTest < Minitest::Test

  def setup
    @a1 = Apartment.new({number: "A1",
                        monthly_rent: 1200,
                        bathrooms: 1,
                         bedrooms: 1})
    @b2 = Apartment.new({number: "B2",
                        monthly_rent: 999,
                        bathrooms: 2,
                        bedrooms: 2})
    @building = Building.new
  end

  def test_building_exists
    assert_instance_of Building, @building
  end

  def test_unit_methods
    assert_equal [], @building.units
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal [@a1,@b2], @building.units
  end

  def test_average_rent_can_be_calculated
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099, @building.average_rent
  end

  def test_renter_with_highest_rent_method
    jessie = Renter.new("Jessie")
    spencer = Renter.new("Spencer")
    @b2.add_renter(spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal spencer, @building.renter_with_highest_rent
    @a1.add_renter(jessie)
    assert_equal jessie, @building.renter_with_highest_rent
  end

  def test_annual_breakdown_method
    jessie = Renter.new("Jessie")
    spencer = Renter.new("Spencer")
    @b2.add_renter(spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal ({"Spencer" => 11988}), @building.annual_breakdown
    @a1.add_renter(jessie)
    assert_equal ({"Jessie" => 14400, "Spencer" => 11988}), @building.annual_breakdown
  end

end
