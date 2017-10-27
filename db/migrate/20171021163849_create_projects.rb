class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.float :progress, default: 0
      t.float :price, default: 0

      t.references :client
      t.references :freelance
      t.references :type_project
      t.references :state_project


      t.timestamps
    end
  end
end
