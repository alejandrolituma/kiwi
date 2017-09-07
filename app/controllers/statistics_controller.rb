class StatisticsController < ActionController::Base
  def index
      @teams = Team.where(city: 'Guadalajara')
  end
end
