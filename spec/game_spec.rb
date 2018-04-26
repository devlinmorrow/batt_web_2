require_relative './../game_logic'

describe BattleshipsGame do
  describe "#convert_to_grid_point" do
    it "turns input to corresponding index in grid array" do
      example_game = BattleshipsGame.new

      expect(example_game.convert_to_grid_point("1")).to equal(0)
    end
  end

  describe "#input_not_in_correct_format?" do
    context "when input not in correct format" do
      it "returns true" do
        example_game = BattleshipsGame.new

        expect(example_game.input_not_in_correct_format?("$01")).to be true
        expect(example_game.input_not_in_correct_format?("asdf")).to be true
        expect(example_game.input_not_in_correct_format?("101")).to be true
      end
    end

    context "when input is in correct format" do
      it "returns false" do
        example_game = BattleshipsGame.new

        expect(example_game.input_not_in_correct_format?("01")).to be false
      end
    end
  end

  describe "#input_has_been_entered_previously?" do
    context "when input has been entered previously" do
      it "returns true" do
        example_game = BattleshipsGame.new

        example_game.miss_mechanics(0)

        expect(example_game.input_has_been_entered_previously?(0)).to be true
      end
    end

    context "when input has not been entered previously" do
      it "returns false" do
        example_game = BattleshipsGame.new

        expect(example_game.input_has_been_entered_previously?(0)).to be false
      end
    end
  end

  describe "#hit?" do
    context "when attack is a hit" do
      it "returns true" do
        example_game = BattleshipsGame.new

        expect(example_game.hit?(3)).to be true
      end
    end
    context "when attack is a miss" do
      it "returns false" do
        example_game = BattleshipsGame.new

        expect(example_game.hit?(0)).to be false
      end
    end
  end

  describe "#hit_mechanics" do
    it "records hit on the grid and on the boat" do
      example_game = BattleshipsGame.new

      example_game.hit_mechanics(3)

      expect(example_game.grid.grid_points[3]).to eq("⚓")
      expect(example_game.boat_1.set_of_grid_points[3]).to be true
    end
  end

  describe "#miss_mechanics" do
    it "records miss on the grid and subtracts one guess" do
      example_game = BattleshipsGame.new

      example_game.miss_mechanics(0)

      expect(example_game.grid.grid_points[0]).to eq("☠")
      expect(example_game.guesses_left).to eq(4)
    end
  end

  describe "#won?" do
    context "when game is won" do
      it "returns true" do
        example_game = BattleshipsGame.new

        example_game.hit_mechanics(2)
        example_game.hit_mechanics(3)
        example_game.hit_mechanics(16)
        example_game.hit_mechanics(17)

        expect(example_game.won?).to be true
      end
    end

    context "when game is not won" do
      it "returns false" do
        example_game = BattleshipsGame.new

        expect(example_game.won?).to be false
      end
    end
  end

  describe "#lost?" do
    context "when game is lost" do
      it "returns true" do
        example_game = BattleshipsGame.new

        example_game.guesses_left = 0

        expect(example_game.lost?).to be true
      end
    end

    context "when game is not lost" do
      it "returns false" do
        example_game = BattleshipsGame.new

        expect(example_game.lost?).to be false
      end
    end
  end

  describe "#boats_left?" do
    it "returns the number of boats remaining" do
      example_game = BattleshipsGame.new

      expect(example_game.boats_left?).to eq(2)
    end
  end
end
