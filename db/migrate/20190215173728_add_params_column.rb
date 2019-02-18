class AddParamsColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :logs, :actions, :parameters
  end
end
