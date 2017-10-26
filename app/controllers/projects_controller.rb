class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_freelance!
  # GET /projects
  # GET /projects.json

  current_freelance = Freelance.find(1)
  def index
    @freelance = current_freelance
    @projects = current_freelance.projects.all
    @incomes = calculate_all_incomes
    @expenses = calculate_all_expenses
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    
  end

  # GET /projects/new
  def new
    @project = current_freelance.projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #queries propias

    #POST PARA LOS CALCULOS TOTALES
  
    # GET PARA RENDEAR EN LA VISTA
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :end_date, :total_price, :client_id, :freelance_id, :state_id, :type_id)
    end


    # calculos internos de la aplicacion
    def calculate_incomes_by_project(projectId)
      project = Project.find(projectId)
      return project.items.sum(:price)
    end

    def calculate_expenses_by_project(projectId)
      project = Project.find(projectId)
      return project.expenses.sum(:price)
    end

    def calculate_all_incomes
        projects = current_freelance.projects
        total_income = 0

        projects.each do |proj|
          total_income += proj.items.sum(:price)
        end

        return total_income
    end

    def calculate_all_expenses
      projects = current_freelance.projects
        
      total_expenses = 0

      projects.each do |proj|
        total_expenses += proj.expenses.sum(:price)
      end

      return total_expenses
    end
end
