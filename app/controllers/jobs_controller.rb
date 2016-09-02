class JobsController < ApplicationController
  before_action :set_job, only:[:show, :edit, :update]
  before_action :get_companies, only:[:new, :edit]

  def show
  end

  def new
    @job = Job.new
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
  end

  def update
    if @job.update(job_parameters)
      redirect_to @job
    else
      flash[:alert] = 'Não foi possível atualizar a vaga'
      get_companies
      render :edit
    end
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
