class Player < ApplicationRecord
  has_many :games

  def batting_average
    @games = Player.find(self.id).games.all
    @at_bats = @games.pluck(:at_bat).sum
    @hits = @games.pluck(:hit).sum

    return @hits.to_f / @at_bats
  end

end
