class AddUserIdColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :recycles, :user_id, :integer
  end
end
