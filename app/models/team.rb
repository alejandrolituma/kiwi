class Team < ActiveRecord::Base
    has_many :team_submissions, dependent: :destroy
end
