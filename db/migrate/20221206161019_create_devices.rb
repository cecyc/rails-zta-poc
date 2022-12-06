class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :kind
      t.string :preferred_browser

      t.timestamps
    end
  end
end
