class WorkOrder < ActiveRecord::Base

  belongs_to :job
  validates :description, presence: true
  validates :price, presence: true

  enum status: [:pending, :completed]
  
end
