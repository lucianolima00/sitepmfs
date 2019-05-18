class Subject < ApplicationRecord
  belongs_to :user
  has_many :questionnaire, dependent: :delete_all
end
