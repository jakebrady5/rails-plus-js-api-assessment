class Job < ActiveRecord::Base

  belongs_to :customer
  belongs_to :mechanic
  has_many :work_orders, dependent: :destroy

  validates :customer_id, presence: true
  validates :mechanic_id, presence: true

  accepts_nested_attributes_for :work_orders

  def work_orders_attributes=(attributes)
    self.save
    attributes.each do |k, v|
      order = WorkOrder.find_or_create_by(id: v[:id])
      order.update(description: v[:description], price: v[:price], job_id: self.id)
    end
  end

  def complete?
    self.work_orders.all == self.work_orders.all.where(status: 1)
  end

  def self.unfinished_jobs
    unfinished = []
    Job.all.each do |job|
      if !job.complete?
        unfinished << job
      end
    end
    unfinished
  end

  def self.finished_jobs
    finished = []
    Job.all.each do |job|
      if job.complete?
        finished << job
      end
    end
    finished
  end

end
