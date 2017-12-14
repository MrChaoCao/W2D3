require 'rspec'
require 'towers'

class TowersOfHanoi

  describe '#initialize' do
    subject(:game) { TowersOfHanoi.new([[3, 2, 1], [], []]) }
    it "starts games with the towers passed in" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

  describe '#move' do
    subject(:game) { TowersOfHanoi.new([[3, 2, 1], [], []]) }
    it "makes moves discs between towers" do
      game.move([0, 1])
      expect(game.towers).to eq([[3, 2], [1], []])
    end
  end


  describe '#won?' do
    # let(:gamedub) { double("gamedub", :towers => [[], [], [3, 2, 1]]) }
    subject(:game) { TowersOfHanoi.new([[3, 2, 1], [], []]) }
    it "knows when the game is in progress" do
      expect(game.won?).to be false
    end

    context 'it knows when the game has been won' do
      let(:game) { TowersOfHanoi.new([[], [3, 2, 1], []]) }
      it "won? returns false" do
        expect(game.won?).to be true
      end
    end
  end

  describe '#valid_move?' do
    subject(:game) { TowersOfHanoi.new([[3, 2], [1], []]) }
    it "won't move a disc onto a smaller disc" do
      expect(game.valid_move?([0,1])).to be false
    end

    it "won't move a disc from an empty tower" do
      expect(game.valid_move?([2,2])).to be false
    end

    it "won't move to a tower that doesn't exist" do
      expect(game.valid_move?([0, 4])).to be false
    end

    it "recognizes valid moves" do
      expect(game.valid_move?([0,2])).to be true
    end
  end
end
