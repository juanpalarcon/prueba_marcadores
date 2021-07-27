class MarkersController < ApplicationController
  before_action :set_marker, only: %i[ show edit update destroy ]

  # GET /markers or /markers.json
  def index
    @marker = Marker.new
    if params[:search]
      @markers = Marker.where("name LIKE ? OR url LIKE ?", "%#{params[:search]}%" , "%#{params[:search]}%") 
      respond_to do |format|
        format.html {redirect_to root_path}
      format.json {render json: @markers}
      format.js 
      end
    else
      @markers = Marker.all
    end
  end

  # GET /markers/1 or /markers/1.json
  def show
  end

  # GET /markers/new
  def new
    @marker = Marker.new
  end

  # GET /markers/1/edit
  def edit
    @types = Type.all
    @categories = Category.all
  end

  # POST /markers or /markers.json
  def create
    @marker = Marker.new(marker_params)

    respond_to do |format|
      if @marker.save
        format.html { redirect_to @marker, notice: "Marker was successfully created." }
        format.json { render :show, status: :created, location: @marker }
        format.js 
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
    @types = Type.all
  end

  # PATCH/PUT /markers/1 or /markers/1.json
  def update
    respond_to do |format|
      if @marker.update(marker_params)
        format.html { redirect_to @marker, notice: "Marker was successfully updated." }
        format.json { render :show, status: :ok, location: @marker }
        format.js 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
    @types = Type.all
  end

  # DELETE /markers/1 or /markers/1.json
  def destroy
    @marker.destroy
    respond_to do |format|
      format.html { redirect_to markers_url, notice: "Marker was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marker_params
      params.require(:marker).permit(:url, :name, :type_id, :category_id)
    end

    def category_params
      params.require(:category)
    end
end