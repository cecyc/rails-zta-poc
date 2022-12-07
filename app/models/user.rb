class User < ApplicationRecord
  has_many :devices

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # this could be abstracted out into a Service
  def check_device_policy(client)
    devices.any? { |device| device.approved?(client) }
  end
end
