class AddWhatsappUserToRecycles < ActiveRecord::Migration[7.1]
  def change
    add_column :recycles, :whatsapp_user, :string
  end
end
