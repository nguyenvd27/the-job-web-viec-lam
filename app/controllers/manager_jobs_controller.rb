class ManagerJobsController < ApplicationController
  before_action :check_logged_in, only: %i(index)
  before_action :find_job, only: %i(show)

  def index
    @jobs = current_user.jobs.by_default.page params[:page]
  end

  def show
  end

  private

  def find_job
    @job = Job.find_by id: params[:id]
    return if @job
      flash[:danger] = "Không thể tìm việc làm"
      redirect_to root_url
  end
end
