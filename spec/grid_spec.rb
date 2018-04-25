require_relative "./../grid"

describe "Grid" do
  describe "#record_hit" do
    it "inputs the hit symbol at the corresponding point on the grid" do
      example_grid = Grid.new

      example_grid.record_hit(1)

      expect(example_grid.grid[1]).to eql("⚓")
    end
  end

  describe "#record_miss" do
    it "inputs the hit symbol at the corresponding point on the grid" do
      example_grid = Grid.new

      example_grid.record_miss(1)

      expect(example_grid.grid[1]).to eql("☠")
    end
  end
end
