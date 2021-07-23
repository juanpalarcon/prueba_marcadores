class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  def marker_category
    @categories = Category.all 
    @markers = Marker.all
    j_name = "Categoria"
    b_name = "Marcador"
    s_name = "subcategoria"
    categoria = []
    marcador = []
    global = []
    
    @categories.each do |cat|
      c_id = cat.id
      c_name = cat.name
      c_status = cat.status
      s_cat = cat.parent
      categoria.push(["#{j_name}",[id: c_id, name: c_name, status: c_status ], "#{s_name}",[category_id: s_cat]])

    end     
    @markers.each do |mark|
      m_name = mark.name
      m_url = mark.url
      m_cat = mark.category_id
      marcador.push(["#{b_name}",[name: m_name, url: m_url, category_id: m_cat]]).last
    end
    render json: marcador.push(categoria).as_json
    
  end

  # GET /categories/new
  def new
    @category = Category.new
    @categories = Category.all

  end

  # GET /categories/1/edit
  def edit
    @categories = Category.all

  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @categories = Category.all


    respond_to do |format|
      if @category.save

        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :status, :category_id)
    end
end
