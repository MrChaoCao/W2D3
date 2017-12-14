class TowersOfHanoi
  attr_reader :towers

  def initialize(towers = [[3, 2, 1], [], []])
    @towers = towers
  end

  def move(moves)
      piece = towers[moves[0]].pop
      towers[moves[1]].push(piece)
  end

  def valid_move?(move) #[0,1]
    from_tower = move[0]
    to_tower = move[1]

    if from_tower > 2 || from_tower < 0
      false
    elsif to_tower > 2 || to_tower < 0
      false
    elsif @towers[from_tower].empty?
      false
    elsif @towers[to_tower].empty?
      true
    elsif @towers[from_tower].last > @towers[to_tower].last
      false
    else
      true
    end
  end

  def won?
    @towers[1..2].any? { |tower| tower.length == 3 }
  end
end
