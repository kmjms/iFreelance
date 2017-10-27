class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.float :price
      t.string :description

      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
