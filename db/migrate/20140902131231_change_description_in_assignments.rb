class ChangeDescriptionInAssignments < ActiveRecord::Migration
  def change
    change_column :assignments, :description, :textarea
  end
end
