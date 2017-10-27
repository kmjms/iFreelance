class Freelance < ApplicationRecord
  has_many :projects
  belongs_to :user
  has_and_belongs_to_many :clients
end
