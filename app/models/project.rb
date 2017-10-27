class Project < ApplicationRecord
  #has_many :detail_invoices
  #has_many :incomes
  #has_many :expenses
  #belongs_to :freelance
  #belongs_to :state_project
  belongs_to :freelance
  belongs_to :client
  has_one :type_project
  has_one :state_project

  has_many :incomes,dependent: :destroy
  has_many :expenses,dependent: :destroy

  def self.demanda_projects
      Project.group(:project_id).order('count(*) desc').limit(7).count
    end
end
