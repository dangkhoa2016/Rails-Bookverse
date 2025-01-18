class CategoriesController < ApplicationController
  include DeleteConcern
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    begin
      @pagy, @categories = pagy(Category)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @categories = Category.none
      else
        raise e
      end
    end

    if @categories.present?
      books_count = Book.count_by_model_ids(:category, @categories.pluck(:id))
      @categories.each do |category|
        category.books_count = books_count[category.id] || 0
      end
    end
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  def options_for_select
    begin
      _, categories = pagy(Category.active.where('name like ?', "%#{params[:keyword]}%"))
      render json: categories.map { |category| { value: category.id, label: category.name } }
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        render json: []
      else
        raise e
      end
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category [#{@category.name}] was successfully created." }
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
        format.html { redirect_to @category, notice: "Category [#{@category.name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description, :active)
    end
end
