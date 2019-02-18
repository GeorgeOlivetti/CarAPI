class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.2]
  def change
         change_column :tokens, :token, :integer, limit: 8
  end
end
