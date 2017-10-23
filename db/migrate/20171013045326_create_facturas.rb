class CreateFacturas < ActiveRecord::Migration[5.1]
  def change
    create_table :facturas do |t|
      t.integer :id_factura
      t.string :name_client
      t.date :fecha
      t.text :descripcion
      t.float :total

      t.timestamps
    end
    add_reference :facturas, :clients, index: true
    add_foreign_key  :facturas, :clients
  end
end
