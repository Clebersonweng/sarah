class User < ApplicationRecord
  has_many :person, :dependent => :destroy
  devise :timeoutable, :timeout_in => 30.minutes
 
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, optional:true
  before_create :set_default_role
  validates_inclusion_of :own_machine, :in => [true, false]
  
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  
  
  
  

  private
  def set_default_role
    self.role ||= Role.find_by_role('registered')
  end
end
