class UserContactsController < ApplicationController

  def create
    @message = Message.new message_params
    if @message.save
      # UserMailer.contact_user(@message).deliver_now
      # flash[:success] = "Gửi tới #{@message.user.email} thành công"
      flash[:success] = "Gửi tới #{@message.user.email} thành công"
      redirect_to resumes_path
    else
      flash[:danger] = "Xuất hiện lỗi khi gửi"
      redirect_to root_path
    end
  end

  private 

  def message_params
    params.require(:message).permit :user_id, :subject, :message
  end
end
