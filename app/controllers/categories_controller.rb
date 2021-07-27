class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy  ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  def marker_category
    @category_marker = Category.where(status: false )
    @markers = Marker.all
    j_name = "Categoria"
    b_name = "Marcador"
    s_name = "subcategoria"
    categoria = []
    marcador = []
    general = {}

    
    @category_marker.each do |cat|
      object_category= {
        type: j_name,
        id: cat.id,
        name: cat.name,
        status: cat.status == false ? 'publico' : 'privado',
        sub_category: cat.parent
      
      
      } 

      categoria.push(object_category)

    end     
    general[:categorias] = categoria 

    @markers.each do |mark|
      object_marker = {
        type: b_name,
        name: mark.name,
        url: mark.url,
        category_id: mark.category_id


      }
      marcador.push(object_marker)
    end
    general[:marcadores] = marcador 

    render json: general
    
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
        format.js

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js {render :new}

      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update

    respond_to do |format|
      if @category.update(category_params)
        unless @category.children.empty?
          @category.children.each do |child|

            child.status = @category.status
            child.save

          end
        end

        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
        format.js



      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js { render :edit}

      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
      format.js

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
