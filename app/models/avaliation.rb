class Avaliation < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :avaliation_question, dependent: :destroy
  has_many :answer_avaliation, dependent: :destroy
end
