class CreateJobLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :job_logs do |t|
      t.integer :state_code
      t.string :message

      t.timestamps
    end

    add_reference :job_logs, :job, index: true
    add_foreign_key  :job_logs, :jobs

  end
end
