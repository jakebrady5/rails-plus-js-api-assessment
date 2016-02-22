class Job < ActiveRecord::Base

  belongs_to :customer
  belongs_to :mechanic
  has_many :work_orders

  validates :customer_id, presence: true
  validates :mechanic_id, presence: true

  accepts_nested_attributes_for :work_orders

  def work_orders=(work_order)
    order = WorkOrder.create(work_order)
    self.save
    order.update(job_id: self.id)
  end

end
