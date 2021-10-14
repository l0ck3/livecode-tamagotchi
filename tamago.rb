class Tamago

  attr_reader :name, :health_points, :thirst, :hunger
  alias_method :health, :health_points

  BASE_HEALTH = 20
  HEALTH_REGEN = 5
  MAX_DAILY_HUNGER = 5
  MAX_DAILY_THIRST = 5

  def initialize(name)
    @name = name
    @health_points = BASE_HEALTH
    @thirst = 0
    @hunger = 0
  end


  def one_day_passes!
    increase_hunger
    increase_thirst
    update_health
  end 

  def feed!
    @hunger = 0
  end

  def give_water!
    @thirst = 0
  end

  def alive?
    @health_points > 0
  end

  def dead?
    !alive?
  end

  private 

  def increase_hunger
    @hunger += rand(MAX_DAILY_HUNGER) + 1
  end

  def increase_thirst
    @thirst += rand(MAX_DAILY_THIRST) + 1
  end

  def update_health
    @health_points += HEALTH_REGEN 
    @health_points = [@health_points, BASE_HEALTH].min
    @health_points -= (@thirst / 2)
    @health_points -= (@hunger / 3)
  end

end