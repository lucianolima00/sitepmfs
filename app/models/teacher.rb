class Teacher < ApplicationRecord
    validates_presence_of :user_id
end
