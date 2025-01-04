class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    begin
      @pagy, @books = pagy(Book)
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

  # GET /books/1 or /books/1.json
  def show
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

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book [#{@book.title}] was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :summary, :isbn, :pages, :price, :stock, :active,
        category_ids: [], author_ids: [], tag_ids: [], genre_ids: [])
    end
end
