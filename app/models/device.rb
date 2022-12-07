# This could be a factory to model against different device types. For now, keeping it simple.
class Device < ApplicationRecord
  belongs_to :user

  def approved?(client)
    return true if os_name.include?(client.os_name) && kind == client.device_type
    return false
  end
end
