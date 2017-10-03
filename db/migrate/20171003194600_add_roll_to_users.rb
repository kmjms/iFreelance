class AddRollToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roll, :integer
  end
end
