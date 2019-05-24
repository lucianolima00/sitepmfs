class Student < ApplicationRecord
    validates_presence_of :user_id
    has_many :user, dependent: :delete_all
    belongs_to :schoolroom

    before_validation :set_default_schoolroom

    private
    def set_default_schoolroom
        self.schoolroom ||= Schoolroom.find_by_name('1o Periodo')
    end
end
