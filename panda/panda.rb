class Panda

  def eat(food)
    %i(bamboo pikas rodent).include? food
  end

  def climb(that_with_which_is_climbed)
    that_with_which_is_climbed == :tree
  end

  def sleep_percentage
    10/24.0
  end
end
