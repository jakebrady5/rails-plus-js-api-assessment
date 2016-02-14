class Job < ActiveRecord::Base

  belongs_to :customer
  belongs_to :mechanic

end
