class KindEntitiesController < ApplicationController
  before_action :set_kind_entity, only: [:show, :edit, :update, :destroy]

  # GET /kind_entities
  # GET /kind_entities.json
  def index
    @kind_entities = KindEntity.all
  end

  # GET /kind_entities/1
  # GET /kind_entities/1.json
  def show
  end

  # GET /kind_entities/new
  def new
    @kind_entity = KindEntity.new
  end

  # GET /kind_entities/1/edit
  def edit
  end

  # POST /kind_entities
  # POST /kind_entities.json
  def create
    @kind_entity = KindEntity.new(kind_entity_params)

    respond_to do |format|
      if @kind_entity.save
        format.html { redirect_to @kind_entity, notice: 'Kind entity was successfully created.' }
        format.json { render :show, status: :created, location: @kind_entity }
      else
        format.html { render :new }
        format.json { render json: @kind_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kind_entities/1
  # PATCH/PUT /kind_entities/1.json
  def update
    respond_to do |format|
      if @kind_entity.update(kind_entity_params)
        format.html { redirect_to @kind_entity, notice: 'Kind entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @kind_entity }
      else
        format.html { render :edit }
        format.json { render json: @kind_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kind_entities/1
  # DELETE /kind_entities/1.json
  def destroy
    @kind_entity.destroy
    respond_to do |format|
      format.html { redirect_to kind_entities_url, notice: 'Kind entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind_entity
      @kind_entity = KindEntity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kind_entity_params
      params.require(:kind_entity).permit(:name, :permits)
    end
end
