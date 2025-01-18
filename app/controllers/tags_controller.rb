class TagsController < ApplicationController
  include DeleteConcern
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    begin
      @pagy, @tags = pagy(Tag)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @tags = Tag.none
      else
        raise e
      end
    end

    if @tags.present?
      books_count = Book.count_by_model_ids(:tag, @tags.pluck(:id))
      @tags.each do |tag|
        tag.books_count = books_count[tag.id] || 0
      end
    end
  end

  # GET /tags/1 or /tags/1.json
  def show
  end

  def options_for_select
    begin
      _, tags = pagy(Tag.active.where("name like ?", "%#{params[:keyword]}%"))
      render json: tags.map { |tag| { value: tag.id, label: tag.name } }
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        render json: []
      else
        raise e
      end
    end
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: "Tag [#{@tag.name}] was successfully created." }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: "Tag [#{@tag.name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name, :active)
    end
end
