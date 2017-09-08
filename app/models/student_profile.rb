class StudentProfile < ActiveRecord::Base
  has_many :memberships, as: :member, dependent: :destroy
  has_many :teams, through: :memberships, source: :joinable, source_type: "Team"
end
