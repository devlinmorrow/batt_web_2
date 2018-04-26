require_relative './../boat'

describe Boat do
  describe "#any_point_matched?" do
    context "when the target grid point matches one of the boat's grid points" do
      it "returns true" do
        example_boat = Boat.new([1])

        expect(example_boat.any_point_matched?(1)).to be true
      end
    end

    context "when the target grid point does not match any of the boat's grid points" do
      it "returns false" do
        example_boat = Boat.new([1])

        expect(example_boat.any_point_matched?(2)).to be false
      end
    end
  end

  describe "#record_hit" do
    it "sets the point value of the boat corresponding to the target grid point to 'true'" do
      example_boat = Boat.new([1])

      example_boat.record_hit(1)

      expect(example_boat.set_of_grid_points[1]).to be true
    end
  end

  describe "#sunk?" do
    context "when all of a boat's grid points have been hit" do
      it "returns true" do
        example_boat = Boat.new([5,6])

        example_boat.record_hit(5)
        example_boat.record_hit(6)

        expect(example_boat.sunk?).to be true
      end
    end

    context "when not all of a boat's grid points have been hit" do
      it "returns false" do
        example_boat = Boat.new([5,6])

        example_boat.record_hit(5)

        expect(example_boat.sunk?).to be false
      end
    end
  end
end


