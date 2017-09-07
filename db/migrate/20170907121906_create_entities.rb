class CreateEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string :user
      t.string :email
      t.string :password
      t.integer :identifier
      t.string :name
      t.string :address
      t.integer :phone

      t.timestamps
    end
      add_reference :entities, :kind_entity, index: true
      add_foreign_key  :entities, :kind_entities


  end
end
