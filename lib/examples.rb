# require 'byebug'

class Array
  def my_uniq
    count = Hash.new { |h, k| h[k] = 0 }
    each { |el| count[el] += 1 }
    count.keys
  end

  def two_sum
    sums = []
    (0 ... self.length - 1).each do |i|
      (i + 1 .. self.length - 1).each do |j|
        sums << [i, j] if (self[i] + self[j]) == 0
      end
    end
    sums
  end


  def my_transpose
    return self if self.length <= 1

    transposed = []
    i = 0

    each_with_index do |row, idx|
      temp = []

      each do |col|
        temp << col[idx]
      end

      transposed << temp
    end

    transposed
  end

def stock_picker
  raise 'Ya can\'t buy and sell stocks on the same day, rookie!' if length <= 1
  best_days = [0, 1]
  greatest_price_diff = self[1] - self[0]

  (0...self.length - 1).each do |i|
    (i + 1..self.length - 1).each do |j|
      if self[j] - self[i] > greatest_price_diff
        best_days = [i, j]
        greatest_price_diff = self[j] - self[i]
      end
    end
  end

  best_days
end


end

# [11, 20,  12, 100, 1, 13, 30].stock_picker
