class Mechanic < ActiveRecord::Base

  has_secure_password

  has_many :jobs
  has_many :customers, through: :jobs

  validates :username, uniqueness: true

end
