class AddClientIdToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :client, foreign_key: true
    #add_column :invoices, :client_id, :integer

  end
end
