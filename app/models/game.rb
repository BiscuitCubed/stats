class Game < ActiveRecord::Base
  belongs_to :player

  #   def at_bats(opts ={})
  #     player = opts[:player] || self.parent
  #     fielders_choice = opts[:fielders_choice] || self.pluck(:fielders_choice).sum
  #     hits = opts[:hits] || self.pluck(:hit).sum
  #     times_reached_on_error = opts[:reached_on_error] ||self.pluck(:reached_on_error).sum
  #     times_put_out = opts[:times_put_out] || self.pluck(:put_out).sum
  #
  #     return fielders_choice + hits + times_reached_on_error + times_put_out
  #   end
end
