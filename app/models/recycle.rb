class Recycle < ApplicationRecord
  belongs_to :user
  validates :item, :category, :description, :price, :city, :state, :email, :whatsapp_user, :image, :user_id, presence: true
end
