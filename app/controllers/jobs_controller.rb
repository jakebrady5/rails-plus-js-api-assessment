class JobsController < ApplicationController
  before_action :set_mechanic, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def new
    @job = Job.new
    3.times do
      @job.work_orders.build
    end
  end

  def create
    @job = Job.new(job_params)
    @mechanic = Mechanic.find_by(id: params[:job][:mechanic_id])
    if @job.save
      render json: @job, status: 201
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

  # best practice to leave these here or put in a separate job_api controller?
  def pending_jobs
    render json: Job.unfinished_jobs
  end

  def completed_jobs
    render json: Job.finished_jobs
  end

  def mechanic_pending_jobs
    @mechanic = current_mechanic
    render json: @mechanic.unfinished_jobs
  end

  def mechanic_completed_jobs
    @mechanic = current_mechanic
    render json: @mechanic.finished_jobs
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