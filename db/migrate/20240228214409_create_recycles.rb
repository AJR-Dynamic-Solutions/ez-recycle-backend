class CreateRecycles < ActiveRecord::Migration[7.1]
  def change
    create_table :recycles do |t|
      t.text :item
      t.string :category
      t.text :description
      t.integer :price
      t.string :city
      t.string :state
      t.string :email
      t.text :image

      t.timestamps
    end
  end
end
