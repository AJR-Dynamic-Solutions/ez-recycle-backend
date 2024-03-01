class RemoveCategoryFromRecycles < ActiveRecord::Migration[7.1]
  def change
    remove_column :recycles, :category, :string
  end
end
