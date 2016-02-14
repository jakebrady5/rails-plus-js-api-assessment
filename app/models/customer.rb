class Customer < ActiveRecord::Base

  has_many :jobs
  has_many :mechanics, through: :jobs

end
