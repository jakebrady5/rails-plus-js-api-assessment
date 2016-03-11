class JobsController < ApplicationController
  before_action :set_mechanic, except: :create
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def new
    # ajax
    @job = Job.new
    3.times do
      @job.work_orders.build
    end
  end

  def create
    # ajax
    @job = Job.new(job_params)
    @mechanic = Mechanic.find_by(id: params[:job][:mechanic_id])
    if @job.save
      redirect_to mechanic_job_path(@mechanic.id, @job.id)
    else
      render 'new'
    end
  end

  def show
    @job = []
    @job << Job.find(params[:id])
  end

  def edit
  end

  def update
    # ajax
    if @job.update(job_params)
      redirect_to mechanic_job_path(@job.mechanic.id, @job.id)
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to '/'
  end

  private
    
    def set_job
      @job = Job.find(params[:id])
    end

    def set_mechanic
      @mechanic = Mechanic.find_by(id: params[:mechanic_id])
    end

    def job_params
      params.require(:job).permit(:mechanic_id, :customer_id, work_orders_attributes: [:description, :price, :id])
    end

end