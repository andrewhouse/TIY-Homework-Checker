class ChangeDateInAssignments < ActiveRecord::Migration
  def change
    change_column :assignments, :date, :date
  end
end
