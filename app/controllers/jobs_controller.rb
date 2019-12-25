class JobsController < ApplicationController
  # before_action :check_logged_in, only: %i(new create apply)
  before_action :find_job, except: %i(new index create)
  before_action :set_search

  def index
    if params[:q].nil?
      @jobs = Job.by_default.page params[:page]
    else
      @jobs = @q.result(distin: true).page params[:page]
    end
  end

  def show
  end

  def new 
    @job = current_user.jobs.new
    @job.job_details.build
  end

  def create
    @job = current_user.jobs.new job_params
    if job.save
      flash[:success] = "Việc làm đã được tạo !"
      redirect_to jobs_path
    else
      flash[:danger] = "Lỗi khi tạo mới !"
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update_attributes job_params
      flash[:success] = "Cập nhật thành công"
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    if @job.delete
      flash[:sucess] = "Xóa thành công"
      redirect_to jobs_path
    end
  end

  def apply
    @resumes = current_user.resumes.by_default.page params[:page]
  end

  def create_apply
    @resume = Resume.find_by id: params[:resume_id]
    if @job.resumes.find_by id: params[:resume_id]
      flash[:danger] = "Bạn đã ứng tuyển, hãy quay lại"
      redirect_to jobs_path
    else
      return if !@resume.apply @job
        # UserMailer.apply_job(current_user).deliver_now
        flash[:success] = "Chúc mừng! Bạn đã ứng tuyển thành công, hãy chờ tin của nhà tuyển dụng !"
        redirect_to jobs_path
    end
  end

  def set_search
    @q= Job.ransack params[:q]
  end

  private 

  attr_reader :job

  def job_params
    params.require(:job).permit Job::ATTRIBUTES_PARAMS,
     job_details_attributes: %i(content)
  end

  def find_job
    @job = Job.find_by id: params[:id]
    return if @job
      flash[:danger] = "Không thể tìm việc làm"
      redirect_to root_url
  end
  
end
