class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :date
      t.string :description

      t.timestamps
    end
  end
end
