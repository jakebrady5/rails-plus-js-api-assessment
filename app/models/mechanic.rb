class Mechanic < ActiveRecord::Base

  has_many :jobs
  has_many :customers, through: :jobs

end
