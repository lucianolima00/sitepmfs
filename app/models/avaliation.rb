class Avaliation < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :avaliation_question, dependent: :delete_all
end
