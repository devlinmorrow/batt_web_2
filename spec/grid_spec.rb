require_relative "./../grid"

describe "Grid" do
  describe "#input_has_been_entered_previously?" do
    context "when input has been entered previously" do
      it "returns true" do
        example_grid = Grid.new

        example_grid.record_hit(1)

        expect(example_grid.input_has_been_entered_previously?(1)).to be true
      end
    end

    context "when input has not been entered previously" do
      it "returns false" do
        example_grid = Grid.new

        expect(example_grid.input_has_been_entered_previously?(1)).to be false
      end
    end
  end

  describe "#record_hit" do
    it "inputs the hit symbol at the corresponding point on the grid" do
      example_grid = Grid.new

      example_grid.record_hit(1)

      expect(example_grid.grid_points[1]).to eq("⚓")
    end
  end

  describe "#record_miss" do
    it "inputs the miss symbol at the corresponding point on the grid" do
      example_grid = Grid.new

      example_grid.record_miss(1)

      expect(example_grid.grid_points[1]).to eq("☠")
    end
  end
end
