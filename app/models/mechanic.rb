class Mechanic < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :customers, through: :jobs

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

end
