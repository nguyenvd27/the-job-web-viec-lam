class ResumesController < ApplicationController
  before_action :check_logged_in, only: %i(new create)
  before_action :find_resume, except: %i(new index create)
  before_action :set_search

  def index
    @resumes = Resume.by_default.page params[:page]
  end

  def show
    @message = @resume.user.messages.new
  end

  def new
    @resume = current_user.resumes.new
    @resume.basic_infos.build
    @resume.socials.build
    @resume.skills.build
    @resume.work_experiences.build
    @resume.educations.build
  end

  def create
    @resume = current_user.resumes.new resume_params
    if resume.save
      flash[:success] = "Hồ sơ được tạo mới !"
      redirect_to resumes_path
    else
      flash[:danger] = "Lỗi khi tạo mới hồ sơ !"
      render :new
    end
  end

  def edit
  end

  def update
    if @resume.update_attributes resume_params
      flash[:success] = "Cập nhật thành công"
      redirect_to resumes_path
    else
      render :edit
    end
  end

  def destroy
    if @resume.delete
      flash[:sucess] = "Xóa thành công"
      redirect_to resumes_path
    end
  end

  private 

  attr_reader :resume

  def resume_params
    params.require(:resume).permit :tag_list, skills_attributes: %i(name proficiency), 
      work_experiences_attributes: %i(company position date_from date_to description),
      educations_attributes: %i(degree major school_name description date_from date_to),
      socials_attributes: %i(facebook_link google_link twitter_link github_link),
      basic_infos_attributes: %i(user_id full_name headline description user_avatar location 
        website salary age phone email_address)
  end

  def find_resume
  @resume = Resume.find_by id: params[:id]
  return if @resume
    flash[:danger] = "Không thể tìm hồ sơ"
    redirect_to root_url
  end

  def set_search
    @q= Resume.ransack params[:q]
  end

end
