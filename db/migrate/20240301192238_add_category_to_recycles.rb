class AddCategoryToRecycles < ActiveRecord::Migration[7.1]
  def change
    add_column :recycles, :category, :string
  end
end
