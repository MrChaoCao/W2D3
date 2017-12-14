require 'rspec'
require 'examples'



describe Array do
  describe '#my_uniq' do


    it 'removes duplicate values' do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end

    it 'does not use the built in uniq function' do
      expect([1, 2, 1, 3, 3].my_uniq).not_to receive(:uniq)
    end
  end

  describe '#two_sum' do
    it 'finds indices of pairs that sum to zero' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    let(:my_matrix)  {[
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8]
                    ]}


    it 'transposes arrays of size 0' do
      expect([].my_transpose).to eq([])
    end
    it 'transposes arrays of size 1' do
      expect([1].my_transpose).to eq([1])
    end
    it 'transposes arrays of many sizes' do
      expect(my_matrix.my_transpose).to eq([[0, 3, 6],
                                           [1, 4, 7],
                                           [2, 5, 8]])
    end

  end

describe '#stock_picker' do
  it 'will return the most profitable days to buy and sell' do
    expect([7, 2, 5, 6, 4, 8, 12, 3].stock_picker).to eq([1, 6])
  end

  it 'won\'t allow time travel' do
    expect([11, 20,  12, 100, 1, 13, 30].stock_picker).to eq([0,3])
  end

  it 'raises an error if there is only one day of prices' do
    expect{ [10].stock_picker }.to raise_error('Ya can\'t buy and sell stocks on the same day, rookie!')
    end
end



end
