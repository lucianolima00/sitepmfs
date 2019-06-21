class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :questionnaire
  belongs_to :subject
  belongs_to :schoolroom
  
  def group_by_criteria
    created_at.to_date.to_s(:db)
  end
end
