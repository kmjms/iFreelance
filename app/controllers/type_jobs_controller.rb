class TypeJobsController < ApplicationController
  before_action :set_type_job, only: [:show, :edit, :update, :destroy]

  # GET /type_jobs
  # GET /type_jobs.json
  def index
    @type_jobs = TypeJob.all
  end

  # GET /type_jobs/1
  # GET /type_jobs/1.json
  def show
  end

  # GET /type_jobs/new
  def new
    @type_job = TypeJob.new
  end

  # GET /type_jobs/1/edit
  def edit
  end

  # POST /type_jobs
  # POST /type_jobs.json
  def create
    @type_job = TypeJob.new(type_job_params)

    respond_to do |format|
      if @type_job.save
        format.html { redirect_to @type_job, notice: 'Type job was successfully created.' }
        format.json { render :show, status: :created, location: @type_job }
      else
        format.html { render :new }
        format.json { render json: @type_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_jobs/1
  # PATCH/PUT /type_jobs/1.json
  def update
    respond_to do |format|
      if @type_job.update(type_job_params)
        format.html { redirect_to @type_job, notice: 'Type job was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_job }
      else
        format.html { render :edit }
        format.json { render json: @type_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_jobs/1
  # DELETE /type_jobs/1.json
  def destroy
    @type_job.destroy
    respond_to do |format|
      format.html { redirect_to type_jobs_url, notice: 'Type job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_job
      @type_job = TypeJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_job_params
      params.require(:type_job).permit(:name, :skilsRequired)
    end
end
