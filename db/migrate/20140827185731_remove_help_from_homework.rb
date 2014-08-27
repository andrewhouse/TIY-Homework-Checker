class RemoveHelpFromHomework < ActiveRecord::Migration
  def change
    remove_column :homeworks, :help
  end
end
