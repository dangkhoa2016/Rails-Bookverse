class BooksController < ApplicationController
  include DeleteConcern
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    begin
      @pagy, @books = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @books = Book.none
      else
        raise e
      end
    end

    if @books.present?
      book_loans_count = BookLoan.count_by_model_ids(:book, @books.pluck(:id))
      authors_count = Author.count_by_book_ids(@books.pluck(:id))
      publishers_count = Publisher.count_by_book_ids(@books.pluck(:id))
      published_dates_count = PublishedDate.count_by_model_ids(:book, @books.pluck(:id))
      reviews_count = Review.count_by_book_ids(@books.pluck(:id))
      @books.each do |book|
        book.book_loans_count = book_loans_count[book.id] || 0
        book.authors_count = authors_count[book.id] || 0
        book.publishers_count = publishers_count[book.id] || 0
        book.published_dates_count = published_dates_count[book.id] || 0
        book.reviews_count = reviews_count[book.id] || 0
      end
    end
  end

  def by_author
    # if params[:author_id].blank?
    #   raise ActionController::ParameterMissing.new('[author_id]')
    # end

    # Author.find(params[:author_id]) # check if the author is exists

    index

    render partial: 'shared/records_list'
  end

  def by_category
    # if params[:category_id].blank?
    #   raise ActionController::ParameterMissing.new('[category_id]')
    # end

    # Category.find(params[:category_id]) # check if the category is exists

    index

    render partial: 'shared/records_list'
  end

  def by_genre
    # if params[:genre_id].blank?
    #   raise ActionController::ParameterMissing.new('[genre_id]')
    # end

    # Genre.find(params[:genre_id]) # check if the genre is exists

    index

    render partial: 'shared/records_list'
  end

  def by_tag
    # if params[:tag_id].blank?
    #   raise ActionController::ParameterMissing.new('[tag_id]')
    # end

    # Tag.find(params[:tag_id]) # check if the tag is exists

    index

    render partial: 'shared/records_list'
  end

  # GET /books/1 or /books/1.json
  def show
  end

  def options_for_select
    begin
      _, books = pagy(Book.active.where('title like ?', "%#{params[:keyword]}%"))
      render json: books.map { |book| { value: book.id, label: book.title } }
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        render json: []
      else
        raise e
      end
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book [#{@book.title}] was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book [#{@book.title}] was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      begin
        @book = Book.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash.now[:alert] = "Book with ID [#{params[:id]}] not found."
      end
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :summary, :isbn, :pages, :price, :stock, :active,
        category_ids: [], author_ids: [], tag_ids: [], genre_ids: [])
    end

    def model_query
      query = Book.includes(:reviews)
      if action_name == 'index'
        return query
      end

      if params[:author_id].present?
        query.joins(:authors).where(authors: { id: params[:author_id] })
      elsif params[:category_id].present?
        query.joins(:categories).where(categories: { id: params[:category_id] })
      elsif params[:tag_id].present?
        query.joins(:tags).where(tags: { id: params[:tag_id] })
      elsif params[:genre_id].present?
        query.joins(:genres).where(genres: { id: params[:genre_id] })
      else
        query
      end
    end
end
