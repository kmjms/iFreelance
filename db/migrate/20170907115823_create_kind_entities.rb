class CreateKindEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :kind_entities do |t|
      t.string :name
      t.integer :permits

      t.timestamps
    end
  end
end
