class IncomesController < ApplicationController
  layout "dashboard"
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /incomes
  # GET /incomes.json
  def index
    @projects = Freelance.find(current_user.id).projects
    @incomes = Income.joins("LEFT JOIN projects on incomes.project_id = projects.id").paginate(page: params[:page], per_page:10)
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @project = Project.find(@income.project_id)
  end

  # GET /incomes/new
  def new
    @projects = Freelance.find(current_user.id).projects
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
    @project = Freelance.find(current_user.id).projects
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @projects = Freelance.find(current_user.id).projects



    @income = Income.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      
      @project = Freelance.find(current_user.id)

      if @income.update(income_params)
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:price,:description, :project_id)
    end
end
