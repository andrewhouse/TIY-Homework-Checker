class AddUserIdToHomework < ActiveRecord::Migration
  def change
    add_column :homeworks, :user_id, :integer

    add_index :homeworks, [:user_id, :created_at]
  end
end
