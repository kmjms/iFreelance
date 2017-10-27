class ProjectsController < ApplicationController
  layout "dashboard"
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /projects
  # GET /projects.json
  def index

    @freelance = Freelance.find(current_user.id)

    @projects = @freelance.projects.paginate(page: params[:page], per_page:10)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @freelance = Freelance.find(current_user.id)
    
    @state_project = StateProject.find(@project.state_project_id).name
    @type_project = TypeProject.find(@project.type_project_id).name

    @client = Client.find(@project.client_id)

    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'pdf/bill', pdf:'bill'}
    end

  end

  # GET /projects/new
  def new
    @freelance = Freelance.find(current_user.id)


    @project = Project.new
    @clients = @freelance.clients.all
    @states_project = StateProject.all
    @type_projects = TypeProject.all
  end

  # GET /projects/1/edit
  def edit
    @freelance = Freelance.find(current_user.id)
    
    @project = @freelance.projects.find(params[:id])
    @clients = @freelance.clients.all
    @states_project = StateProject.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @freelance = Freelance.find(current_user.id)

    @project = @freelance.projects.new(project_params)
    @clients = @freelance.clients.all
    @states_project = StateProject.all
    @type_projects = TypeProject.all

    respond_to do |format|
      if @project.save
        redirect_to projects_path
      format.html { redirect_to @project, notice: 'Project was successfully created.' }
      format.json { render :show, status: :created, location: @project }
      else
        render 'new'
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    

    @project = @freelance.projects.find(params[:id])
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
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @freelance = Freelance.find(current_user.id)

      @project = @freelance.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :end_date, :client_id, :state_project_id, :price, :progress, :type_project_id).merge(:freelance_id => current_user.id)
    end
end
