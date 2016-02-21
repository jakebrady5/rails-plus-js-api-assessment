class Job < ActiveRecord::Base

  belongs_to :customer
  belongs_to :mechanic

  validates :description, presence: true
  validates :price, presence: true

end
