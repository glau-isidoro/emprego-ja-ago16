class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
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


  private

  def job_parameters
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end

  def get_companies
    @companies = Company.all
  end


end
