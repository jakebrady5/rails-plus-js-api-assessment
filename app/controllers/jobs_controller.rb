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

  def jobs
    params[:scoped] ? scope = current_mechanic : scope = Job
    if params[:state] == 'completed'
      render json: scope.finished_jobs
    else
      render json: scope.unfinished_jobs
    end
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