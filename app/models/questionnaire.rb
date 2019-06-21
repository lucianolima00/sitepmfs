class Questionnaire < ApplicationRecord
    belongs_to :subject
    has_many :answer, dependent: :delete_all
    has_many :question, dependent: :destroy
    has_many :grade, dependent: :nullify

end
