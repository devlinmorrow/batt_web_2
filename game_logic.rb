require_relative 'grid.rb'
require_relative 'boat.rb'
require_relative 'boat_list.rb'

class BattleshipsGame

  attr_reader :grid, :guesses_left

  def initialize
    @guesses_left = 5
    @grid = Grid.new
    @boat_1 = Boat.new([2,3])
    @boat_2 = Boat.new([16,17])
    @boat_list = BoatList.new([@boat_1,@boat_2])
  end

  def input_is_in_correct_format?(input)
    input.between?(1,25)
  end

  def input_has_not_been_entered_previously?(grid_point)
    grid_point.to_i.between?(1,25)
  end

  def hit?(input)
    @boat_list.any_boat_hit?(input)
  end

  def hit_mechanics(input)
    @grid.record_hit(input)
    @boat_list.record_boat_hit(input)
  end

  def boat_sunk?(input)
    @boat_list.boat_sunk?(input)
  end

  def miss_mechanics(input)
    @grid.record_miss(input)
    @guesses_left -= 1
  end

  def won?
    @boat_list.all_boats_sunk?
  end

  def lost?
    @guesses_left == 0
  end

  def boats_left?
    @boat_list.count_boats_not_sunk
  end
end

