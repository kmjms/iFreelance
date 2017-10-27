class AdminController < ApplicationController
  before_action :authenticate_user!


  layout "dashboard"
  def index
    @freelance = Freelance.find(current_user.id)

    @projects_demanda = @freelance.projects.demanda_projects
    @total_clients = @freelance.clients.count
    @ultimos_projects = Project.recientes
    ##@suma = Income.ingresos or 50 @freelance.projects.joins(:incomes).sum("incomes.price")
    @suma =  @freelance.projects.joins(:incomes).sum("incomes.price")
    @facturapend = Invoice.facturas
    @total_proyectos = Project.count
  end

end
