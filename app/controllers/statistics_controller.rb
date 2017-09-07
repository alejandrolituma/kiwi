class StatisticsController < ActionController::Base
  def index
      @teams = Team.where(city: 'Guadalajara')
  end
  
  def journey

  end
  
  def events

  end
  
end
