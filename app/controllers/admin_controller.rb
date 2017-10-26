class AdminController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  def index
    @projects_demanda = Project.demanda_projects
    @total_clients = Client.count
  end

end
