class LoginController < ApplicationController
  def new; end

  def create
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to dashboard_index_path
    else
      redirect_to :new
    end
  end
end
