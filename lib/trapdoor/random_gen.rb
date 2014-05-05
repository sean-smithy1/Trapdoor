module RandomGen
  def self.between(num1, num2)
    srand()
    rand(num1..num2)
  end

  def self.hitpoints(const)
    stat=0
    3.times { stat += between(1, 6) }
    case const
      when 4..9
        stat = stat-((10-const.to_f)/2).round
      when 12..18
        stat = stat+((const.to_f-11)/2).round
      else
        stat
    end
    stat
  end

  def self.char_stat
    stat=0
    3.times { stat += between(1, 6) }
    stat
  end

end
