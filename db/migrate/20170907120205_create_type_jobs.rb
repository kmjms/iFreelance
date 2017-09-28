class CreateTypeJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :type_jobs do |t|
      t.string :name
      t.integer :skilsRequired

      t.timestamps
    end
  end
end
