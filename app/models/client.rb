class Client < ApplicationRecord
  #belongs_to :user
  #enum status: [:active, :inactive]
  client = Client.find(10)
  client = Client.take
  client = Client.first
  Client.page(10)
  paginates_per 10

end
