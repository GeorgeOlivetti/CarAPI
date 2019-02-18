class ChangeTokenToString < ActiveRecord::Migration[5.2]
  def change
      change_column :tokens, :token, :string
  end
end
