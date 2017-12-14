require 'rspec'
require 'towers'

class TowersOfHanoi
  describe '#move' do
    subject(:game) { TowersOfHanoi.new([[3, 2, 1], [], []]) }

    it "won't move a disc onto a smaller disc" do
      game.move([0, 1])
      game.move([0, 1])
      expect(game.towers).to eq([[3, 2], [1], []])
    end

    it "won't move a disc from an empty tower" do
      game.move([1, 2])
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end

    it "won't move to a tower that doesn't exist" do
      game.move([0, 4])
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end

    it "makes valid moves" do
      game.move([0, 1])
      expect(game.towers).to eq([[3, 2], [1], []])
    end
  end


  describe '#won?' do
    let(:gamedub) { double("gamedub", :towers => [[], [3, 2, 1]]) }
    it "knows when tower one or two is full" do
      expect(gamedub.won?).to eq(true)
    end

    context 'when game is not won, won?' do
      let(:gamedub) { double("gamedub", :towers => [[3, 2, 1], []]) }
      it "won? returns false" do
        expect(game.won?).to eq(false)
      end
    end
  end

end
