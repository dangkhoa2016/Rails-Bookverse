class AuthorsController < ApplicationController
  include DeleteConcern
  before_action :set_author, only: %i[ show edit update destroy ]

  # GET /authors or /authors.json
  def index
    begin
      @pagy, @authors = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @authors = Author.none
      else
        raise e
      end
    end

    if @authors.present?
      author_profiles_count = AuthorProfile.count_by_author_ids(@authors.pluck(:id))
      books_count = Book.count_by_model_ids(:author, @authors.pluck(:id))
      @authors.each do |author|
        author.author_profiles_count = author_profiles_count[author.id] || 0
        author.books_count = books_count[author.id] || 0
      end
    end
  end

  def by_book
    # if params[:book_id].blank?
    #   raise ActionController::ParameterMissing.new('[book_id]')
    # end

    # Book.find(params[:book_id]) # check if the book is exists

    index

    render partial: "shared/records_list"
  end

  # GET /authors/1 or /authors/1.json
  def show
    # puts "show: #{params[:id]}, #{params[:format]}, #{request.format}, #{request.variant}"
    # puts "request.headers['Turbo-Frame']: #{request.headers['Turbo-Frame']}"
    # puts "request.headers['Turbo-Frame-Request']: #{request.headers['Turbo-Frame-Request']}"
    # puts "turbo_frame_request: #{turbo_frame_request?}"
  end

  def options_for_select
    begin
      _, authors = pagy(Author.active.where("first_name or last_name or email like ?", "%#{params[:keyword]}%"))
      render json: authors.map { |author| { value: author.id, label: author.full_name } }
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        render json: []
      else
        raise e
      end
    end
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: "Author [#{@author.full_name}] was successfully created." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: "Author [#{@author.full_name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      begin
        @author = Author.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash.now[:alert] = "Author with ID [#{params[:id]}] not found."
      end
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:first_name, :last_name, :email, :active)
    end

    def model_query
      query = Author
      if action_name == "index"
        return query
      end

      if params[:book_id].present?
        query.joins(:books).where(books: { id: params[:book_id] })
      else
        query
      end
    end
end
