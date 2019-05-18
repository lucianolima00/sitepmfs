class Question < ApplicationRecord
  belongs_to :questionnaire
  has_one_attached :picStatement
end
