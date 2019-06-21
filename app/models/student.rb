class Student < ApplicationRecord
    validates_presence_of :user_id
    belongs_to :user
    belongs_to :schoolroom
    has_many :answer, dependent: :destroy
    has_many :grades, dependent: :destroy

    before_validation :set_default_schoolroom

    private
    def set_default_schoolroom
        self.schoolroom ||= Schoolroom.find_by_name('1o Periodo')
    end
end
