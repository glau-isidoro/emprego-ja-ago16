class JobsController < ApplicationController

  def show
    set_job
  end

  def new
    @job = Job.new
    get_companies
  end

  def create
    @job = Job.new(job_parameters)
    if @job.save
      redirect_to @job
    else
      flash[:alert] = 'Não foi possível criar a vaga'
      get_companies
      render :new
    end
  end

  def edit
    set_job
    get_companies
  end

  def update
    set_job
    @job.update(job_parameters)
    redirect_to @job
  end


  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_parameters
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end

  def get_companies
    @companies = Company.all
  end


end
