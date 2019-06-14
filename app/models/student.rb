class Student < ApplicationRecord
    validates_presence_of :user_id
    has_one :user
    has_one :schoolroom
    has_many :answer, dependent: :delete_all

    before_validation :set_default_schoolroom

    private
    def set_default_schoolroom
        self.schoolroom ||= Schoolroom.find_by_name('1o Periodo')
    end
end
