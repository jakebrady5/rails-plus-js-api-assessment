class Job < ActiveRecord::Base

  belongs_to :customer
  belongs_to :mechanic
  has_many :work_orders, dependent: :destroy

  validates :customer_id, presence: true
  validates :mechanic_id, presence: true

  def work_orders_attributes=(attributes)
    self.save
    attributes.each do |k, v|
      order = WorkOrder.find_or_create_by(id: v[:id])
      order.update(description: v[:description], price: v[:price], job_id: self.id)
    end
  end

  def complete?
    work_orders.pluck(:status).all? { |status| status == 1 }
  end

  def self.unfinished_jobs
    includes(:work_orders).where(work_orders: { status: 0 })
  end

  def self.finished_jobs
    includes(:work_orders).where(work_orders: { status: 1 }).select(&:complete?)
  end

end
