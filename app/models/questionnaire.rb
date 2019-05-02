class Questionnaire < ApplicationRecord
    validates_presence_of :subject, :noQuestion
end
