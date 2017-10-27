class Invoice < ApplicationRecord
  #belongs_to :client
  #has_many :detail_invoices
  def self.facturas
      Invoice.count(:state == "pendiente")
    end

end
