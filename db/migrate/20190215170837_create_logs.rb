class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :action
      t.string :token
      t.text :actions
      t.timestamps
    end
  end
end
