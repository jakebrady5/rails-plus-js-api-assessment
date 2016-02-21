class Job < ActiveRecord::Base

  belongs_to :customer
  belongs_to :mechanic
  has_many :work_orders

  validates :description, presence: true
  validates :price, presence: true

end
