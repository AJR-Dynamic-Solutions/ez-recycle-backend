class CreateWhatsAppUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :whats_app_users do |t|
      t.string :username

      t.timestamps
    end
  end
end
