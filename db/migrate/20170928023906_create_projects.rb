class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :modality
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
