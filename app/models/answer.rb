class Answer < ApplicationRecord
  belongs_to :student, dependent: :destroy
  belongs_to :questionnaire, dependent: :destroy

end
