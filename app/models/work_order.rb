class WorkOrder < ActiveRecord::Base

  belongs_to :job

  enum status: [:pending, :completed]
  
end
