require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/building'

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
end
