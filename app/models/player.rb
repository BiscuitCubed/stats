class Player < ApplicationRecord
  has_many :games

  def set_values(opts = {})
    # if @opts is no set, or if custom inputs have been past to a method, this method is called to set default values
    # to override the defaults, call set_values(:my_attribute => my_value)
    opts[:games]                  ||= self.games.all
    opts[:runs]                   ||= games.pluck(:run).sum
    opts[:hits]                   ||= games.pluck(:hit).sum
    opts[:walks]                  ||= games.pluck(:walk).sum
    opts[:times_reached_on_fielders_choice]  ||= games.pluck(:fielders_choice).sum
    opts[:times_reached_on_error] ||= games.pluck(:reached_on_error).sum
    opts[:sacrifice_hits]         ||= games.pluck(:sacrifice_hit).sum
    opts[:sacrifice_flies]         ||= games.pluck(:sacrifice_fly).sum
    opts[:times_hit_by_pitch]     ||= games.pluck(:hit_by_pitch).sum
    opts[:times_reached_on_defensive_interference] ||= games.pluck(:reached_on_defensive_interference).sum
    opts[:times_reached_on_some_other_reason] ||= games.pluck(:reached_on_some_other_reason).sum
    opts[:runs_batted_in]         ||= games.pluck(:run_batted_in).sum
    opts[:home_runs]              ||= games.pluck(:home_run).sum
    opts[:stolen_bases]           ||= games.pluck(:stolen_base).sum
    opts[:strike_outs]            ||= games.pluck(:strike_out).sum
    opts[:times_put_out]          ||= games.pluck(:put_out).sum

    opts
  end

  def at_bats(opts = {})
    if opts.present? #check if there are any custom paramaters passed
      custom_hash = set_values(opts)
      return custom_hash[:times_reached_on_fielders_choice] + custom_hash[:hits] + custom_hash[:times_reached_on_error] + custom_hash[:times_put_out]
    end

    @opts ||= set_values
    @opts[:times_reached_on_fielders_choice] + @opts[:hits] + @opts[:times_reached_on_error] + @opts[:times_put_out]
  end

  def plate_apperances(opts = {})
    if opts.present?
      custom_hash = set_values(opts)
      return custom_hash[:at_bats] + custom_hash[:times_hit_by_pitch] + custom_hash[:sacrifice_hits] + custom_hash[:times_reached_on_defensive_interference] + custom_hash[:walks]
    end

    @opts ||= set_values
    self.at_bats + @opts[:times_hit_by_pitch] + @opts[:sacrifice_hits] + @opts[:times_reached_on_defensive_interference] + @opts[:walks]
  end

  def batting_average(opts = {})
    if opts.present?
      custom_hash = set_values(opts)
      return '%.3f' % (custom_hash[:hits].to_f / self.at_bats)
    end

    @opts ||= set_values
    return '%.3f' % (@opts[:hits].to_f / self.at_bats)
  end

  def on_base_percentage(opts = {})
    if opts.present?
      custom_hash = set_values(opts)
      return '%.3f' % (custom_hash[:hits] + custom_hash[:walks] + custom_hash[:times_hit_by_pitch]).to_f / (self.at_bats + custom_hash[:walks] + custom_hash[:times_hit_by_pitch] + custom_hash[:sacrifice_fly])
    end

    @opts ||= set_values
    return '%.3f' % ((@opts[:hits] + @opts[:walks] + @opts[:times_hit_by_pitch]).to_f / (self.at_bats + @opts[:walks] + @opts[:times_hit_by_pitch] + @opts[:sacrifice_fly]))
  end

end
