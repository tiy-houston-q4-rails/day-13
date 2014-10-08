require 'minitest/autorun'
require 'minitest/pride'
require './panda'

class PandaTest < MiniTest::Test

  def test_panda_eats_bamboo_pikas_rodent
    panda = Panda.new
    %i(bamboo pikas rodent).each do |food|
      assert_equal true, panda.eat(food)
    end
  end

  def test_panda_does_not_eat_bacon
    panda = Panda.new
    assert_equal false, panda.eat(:bacon)
  end

  def test_panda_climbs_trees
    panda = Panda.new
    assert_equal true, panda.climb(:tree)
  end

  def test_panda_does_not_climbs_hill
    panda = Panda.new
    assert_equal false, panda.climb(:hill)
  end

end
