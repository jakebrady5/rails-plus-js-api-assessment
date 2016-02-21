class JobsController < ApplicationController
  before_action :set_mechanic, except: :create

  def index
    @jobs = Job.all
  end

  def new
    @mechanics = Mechanic.all
    @customers = Customer.all
    @job = Job.new
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
  end

  def update
  end

  def destroy
  end

  private
    def set_mechanic
      @mechanic = Mechanic.find_by(id: params[:mechanic_id])
    end

    def job_params
      params.require(:job).permit(:mechanic_id, :customer_id, :description, :price)
    end

end