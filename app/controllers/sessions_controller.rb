class SessionsController < Devise::SessionsController
  def new
  end

  def create
    user = User.find_by email: sign_in_params[:email]
    if user
      sign_in user
      flash[:success] = "Đăng nhập thành công"
      redirect_to jobs_path
    else
      flash[:danger] = "Tài khoản hoặc mật khẩu không chính xác"
      redirect_to jobs_path
    end
  end

  def destroy
    if user_signed_in?
      sign_out current_user
      flash[:success] = "Đăng xuất !"
      redirect_to login_path
    else
      flash[:danger] = "Không đăng nhập !"
      redirect_to root_path
    end
  end

  private

  attr_accessor :user

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
