class Questionnaire < ApplicationRecord
    validates_presence_of :subject_id
    belongs_to :subject
    has_many :answer, dependent: :delete_all
    has_many :question, dependent: :delete_all
end
