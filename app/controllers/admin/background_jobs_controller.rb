class Admin::BackgroundJobsController < ApplicationController
  include AutoInject["jobs_all_service", "jobs_launch_service", "jobs_toggle_service"]

  before_action :authenticate_user!

  def index
    result = jobs_all_service.call
    @jobs = result.data
  end

  def toggle
    result = jobs_toggle_service.call(params[:name])
    job = result.data

    respond_to do |format|
      format.json { render json: { message: "", html: render_job(job), name: job.name }, status: :ok }
    end
  end

  def launch
    result = jobs_launch_service.call(params[:name])
    job = result.data

    respond_to do |format|
      format.json { render json: json_message(job), status: :ok }
    end
  end

  private

  def launch_json_message(job)
    { message: "Job #{job.name} was successful started", html: render_job(job), name: job.name }
  end

  def toggle_json_message(job)
    { message: "Job #{job.name} was successful toggled", html: render_job(job), name: job.name }
  end

  def render_job(job)
    render_to_string(Jobs::JobComponent.new(job: job))
  end
end
