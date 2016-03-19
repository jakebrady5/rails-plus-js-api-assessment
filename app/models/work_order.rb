class WorkOrder < ActiveRecord::Base

  belongs_to :job
  validates :description, presence: true
  validates :price, presence: true

  enum status: [:pending, :completed]

  def self.mark_complete_by_ids(ids)
    ids.each do |id|
       order = WorkOrder.find_by(id: id)
       order.update(status: 1)
    end
  end
  
end
