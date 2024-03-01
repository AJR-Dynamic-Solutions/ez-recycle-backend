class RenameItemToCategoryInRecycles < ActiveRecord::Migration[7.1]
  def change
    # Check if the 'category' column exists before attempting to rename
    unless column_exists?(:recycles, :category)
      rename_column :recycles, :item, :category
    end
  end
end