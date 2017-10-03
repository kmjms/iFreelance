class CreateRolls < ActiveRecord::Migration[5.1]
  def change
    create_table :rolls do |t|
      t.string :name

      t.timestamps
    end
  end
end
