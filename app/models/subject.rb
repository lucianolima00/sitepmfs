class Subject < ApplicationRecord
  after_save :set_subject_teacher
  before_destroy :delete_subject_teacher

  belongs_to :teacher
  has_many :questionnaire, dependent: :destroy
  has_many :avaliation, dependent: :destroy
  has_many :grade, dependent: :destroy

  private
  def set_subject_teacher
    @user = User.find(Teacher.find(self.teacher_id).user_id)
    unless @user.subjects.include?(self.id)
      @user.subjects << self.id
    end
    @user.save
  end

  def delete_subject_teacher
    @user = User.find(Teacher.find(self.teacher_id).user_id)
    if @user.subjects.include?(self.id)
      @user.subjects.delete(self.id)
    end
    @user.save
  end
end
