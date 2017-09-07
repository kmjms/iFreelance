class CreateQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :quotations do |t|
      t.integer :quotationNumber
      t.float :price
      t.integer :duration
      t.string :description

      t.timestamps
    end

    add_reference :quotations, :entity, index: true
    add_foreign_key  :quotations, :entities

    add_reference :quotations, :client, index: true
    add_foreign_key  :quotations, :clients

  end
end
