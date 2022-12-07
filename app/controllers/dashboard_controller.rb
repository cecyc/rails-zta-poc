class DashboardController < ApplicationController
  before_action :set_user
  before_action :verify_device, only: [:super_secret]

  def index; end

  def profile; end

  def super_secret; end

  private

  def set_user
    @user = current_user
  end

  def verify_device
    client = DeviceDetector.new(request.user_agent)
    unless @user.check_device_policy(client)
      redirect_to dashboard_profile_path, notice: "🛑 Your device does not meet the requirements to access this resource!"
    end
  end
end
