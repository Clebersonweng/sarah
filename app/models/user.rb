class User < ApplicationRecord
  has_many :employees
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, optional:true
  before_create :set_default_role
  validates_inclusion_of :own_machine, :in => [true, false]
  # or 
  # before_validation :set_default_role 

  private
  def set_default_role
    self.role ||= Role.find_by_role('registered')
  end
end
