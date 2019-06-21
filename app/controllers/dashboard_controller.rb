class DashboardController < ApplicationController
  def dashboardAdmin
    @schoolroom_grades = {}
    Schoolroom.all.order(id: :asc).each do |school|
      @grades = {}
      @grade = []
      Grade.group(:schoolroom_id).group("date_trunc('day', created_at)").sum(:grade).each do |g|
        if g.first[0] == school.id
          @grade << g.last
        end
      end
      @schoolroom_grades[school.name] = @grade
    end 
  end
end
