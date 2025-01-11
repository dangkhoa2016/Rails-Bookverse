class ReviewsController < ApplicationController
  include DeleteConcern
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    begin
      @pagy, @reviews = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @reviews = Review.none
      else
        raise e
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

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: "Review for the book [#{@review.book.title}] was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review for the book [#{@review.book.title}] was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:content, :rating, :book_id, :active)
    end

    def model_query
      query = Review.includes(:book)
      if action_name == "index"
        return query
      end

      if params[:book_id].present?
        query.where(book_id: params[:book_id])
      else
        query
      end
    end
end
