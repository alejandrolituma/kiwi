class Team < ActiveRecord::Base
    has_many :team_submissions, dependent: :destroy
    has_many :memberships, as: :joinable, dependent: :destroy
    has_many :students, -> { order("memberships.created_at") },
        through: :memberships,
        source: :member,
        source_type: "StudentProfile"
end
