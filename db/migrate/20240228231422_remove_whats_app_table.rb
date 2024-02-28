class RemoveWhatsAppTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :whats_app_users
  end
end
