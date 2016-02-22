class JobsController < ApplicationController
  before_action :set_mechanic, except: :create

  def index
    @jobs = Job.all
  end

  def new
    @mechanics = Mechanic.all
    @customers = Customer.all
    @job = Job.new
    3.times do
      @job.work_orders.build
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      @mechanic = Mechanic.find_by(id: params[:job][:mechanic_id])
      redirect_to mechanic_job_path(@mechanic.id, @job.id)
    else
      @mechanic = Mechanic.find_by(id: params[:job][:mechanic_id])
      @mechanics = Mechanic.all
      @customers = Customer.all
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @mechanics = Mechanic.all
    @customers = Customer.all
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to mechanic_job_path(@job.mechanic.id, @job.id)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def set_mechanic
      @mechanic = Mechanic.find_by(id: params[:mechanic_id])
    end

    def job_params
      params.require(:job).permit(:mechanic_id, :customer_id, work_orders_attributes: [:description, :price, :id])
    end

end