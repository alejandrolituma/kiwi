class Event < ActiveRecord::Base
    @totalTeams
    @contestRanks
    
   has_many :attendances, class_name: "EventAttendance"
    
   has_many :students,
        through: :attendances,
        source: :attendee,
        source_type: "StudentProfile"
    
   has_many :mentors,
        through: :attendances,
        source: :attendee,
        source_type: "MentorProfile"

   
end