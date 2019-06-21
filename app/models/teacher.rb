class Teacher < ApplicationRecord
    validates_presence_of :user_id
    has_many :subject, dependent: :destroy
end
