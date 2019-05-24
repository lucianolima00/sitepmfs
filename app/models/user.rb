require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable


  belongs_to :role
  has_one :student, dependent: :delete
  has_one :teacher, dependent: :delete
  has_many :questionnaire, dependent: :delete_all
  has_many :subject, dependent: :delete_all
  has_one_attached :avatar


  before_validation :set_default_role, :set_admin_status

  private
  def set_default_role
    self.role ||= Role.find_by_name('student')
  end

  def set_admin_status
    self.admin ||= false
  end

end
