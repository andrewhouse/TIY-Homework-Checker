class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :link_to_homework
      t.boolean :finished
      t.string :help

      t.timestamps
    end
  end
end
