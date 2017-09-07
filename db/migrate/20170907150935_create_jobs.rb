class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :billNumber
      t.string :name
      t.float :price
      t.integer :duration
      t.boolean :state

      t.timestamps
    end

    add_reference :jobs, :client, index: true
    add_foreign_key  :jobs, :clients

    add_reference :jobs, :entity, index: true
    add_foreign_key  :jobs, :entities

    add_reference :jobs, :type_job, index: true
    add_foreign_key  :jobs, :type_jobs
  end
end
