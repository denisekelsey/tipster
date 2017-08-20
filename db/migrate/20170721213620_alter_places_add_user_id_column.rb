class AlterPlacesAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :user_id, :user_name, :integer
    add_index :places, :user_id, :user_name

  end
end
