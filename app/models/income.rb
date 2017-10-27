class Income < ApplicationRecord
  #belongs_to :freelance
  belongs_to :project
  before_create :add_price
  before_destroy :remove_price

  private
  
  def add_price
    project = Project.find(self.project_id)
    newValue = project.price + self.price
    project.update(price:newValue)
  end

  def remove_price
    project = Project.find(self.project_id)
    newValue = project.price - self.price
    project.update(price:newValue)
  end
end
