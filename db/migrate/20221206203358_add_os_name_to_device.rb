class AddOsNameToDevice < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :os_name, :string
  end
end
