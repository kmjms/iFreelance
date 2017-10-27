class Freelance < ApplicationRecord
  has_many :projects
  has_and_belongs_to_many :users
end
