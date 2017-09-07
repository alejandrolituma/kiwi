require 'json'

class TeamSubmission < ActiveRecord::Base
    belongs_to :team, touch: true
end
