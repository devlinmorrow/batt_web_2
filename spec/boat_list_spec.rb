require_relative './../boat_list'
require_relative './../boat'

describe BoatList do
  describe "#any_boat_hit?" do
    context "when the target grid point hits the grid point of a boat" do
      it "returns true" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        expect(example_boat_list.any_boat_hit?(1)).to be true
      end
    end

    context "when the target grid point does not hit any boat's grid points" do
      it "returns false" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

       expect(example_boat_list.any_boat_hit?(2)).to be false
      end
    end
  end

  describe "#record_boat_hit" do
      it "sets value of boat point corresponding to target grid point to 'true'" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        example_boat_list.record_boat_hit(1)

        expect(example_boat.set_of_grid_points[1]).to be true
      end
    end

  describe "#boat_sunk?" do
    context "when corresponding boat has been sunk" do
      it "returns true" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        example_boat_list.record_boat_hit(1)

        expect(example_boat_list.boat_sunk?(1)).to be true
      end
    end

    context "when corresponding boat has not been sunk" do
      it "returns false" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        expect(example_boat_list.boat_sunk?(1)).to be false
      end
    end
  end

  describe "#count_boats_not_sunk" do
      it "returns the number of boats not yet sunk" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        expect(example_boat_list.count_boats_not_sunk).to eql(1)
      end
  end

  describe "#all_boats_sunk?" do
    context "when all boats have been sunk" do
      it "returns true" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        example_boat.record_hit(1)

        expect(example_boat_list.all_boats_sunk?).to be true
      end
    end

    context "when not all boats have been sunk" do
      it "returns false" do
        example_boat = Boat.new([1])
        example_boat_list = BoatList.new([example_boat])

        expect(example_boat_list.all_boats_sunk?).to be false
      end
    end
  end
end

