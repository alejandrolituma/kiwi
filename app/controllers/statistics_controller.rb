class StatisticsController < ActionController::Base
  def index
      @teams = Team.where(city: 'Almaty')
  end
  
  def journey

  end
  
  def events
   eventsTmp = Event.where(place: 'Anycity, Anystate')
      
     eventsTmp.each do |event|  
       eventRank = {-1 =>0, 0 => 0, 1 => 0, 2 => 0, 3 => 0}
        teams = Array.new
        event.attendances.each do |attendee|
            memberships = Membership.where(member_id: attendee.attendee_id)
            memberships.each do |member|  
               teams.push(member.joinable_id)
              
                
           end
        end
        rest = 0
        totalTeams = teams.uniq
        totalTeams.each do |t|
          teamSubmision = TeamSubmission.where(team_id: t)
          teamSubmisionFirst = teamSubmision.first
          if not teamSubmisionFirst.nil?
            rest = rest + 1;
            if(teamSubmisionFirst.contest_rank == 0 &&  teamSubmisionFirst.demo_video_link==nil ||
                                                        teamSubmisionFirst.source_code==nil ||
                                                        teamSubmisionFirst.pitch_video_link==nil ||
                                                        teamSubmisionFirst.stated_goal_explanation==nil)
              eventRank[-1] = eventRank[-1] + 1
            else
              eventRank[teamSubmisionFirst.contest_rank] = eventRank[teamSubmisionFirst.contest_rank] + 1
            end
            
         end
        end
        eventRank[-1] = eventRank[-1] + (totalTeams.length - rest)
        event.instance_variable_set(:@totalTeams, totalTeams)
        event.instance_variable_set(:@contestRanks, eventRank)
      end
      
     @events = eventsTmp
  end
  
end
