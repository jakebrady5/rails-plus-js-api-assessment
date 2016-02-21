class JobsController < ApplicationController
  before_action :set_mechanic, except: :index

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    redirect_to mechanic_job_path(@job)
  end

  def show
    binding.pry
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
      @mechanic = Mechanic.find(params[:mechanic_id])
    end

    def job_params
      params.require(:job).permit(:mechanic_id, :customer_id, :description, :price)
    end

end