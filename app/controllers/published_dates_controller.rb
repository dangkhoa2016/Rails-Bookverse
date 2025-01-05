class PublishedDatesController < ApplicationController
  before_action :set_published_date, only: %i[ show edit update destroy ]

  # GET /published_dates or /published_dates.json
  def index
    begin
      @pagy, @published_dates = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @published_dates = PublishedDate.none
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

    render partial: 'shared/records_list'
  end

  def by_publisher
    # if params[:publisher_id].blank?
    #   raise ActionController::ParameterMissing.new('[publisher_id]')
    # end

    # Publisher.find(params[:publisher_id]) # check if the publisher is exists

    index

    render partial: 'shared/records_list'
  end

  # GET /published_dates/1 or /published_dates/1.json
  def show
  end

  # GET /published_dates/new
  def new
    @published_date = PublishedDate.new
  end

  # GET /published_dates/1/edit
  def edit
  end

  # POST /published_dates or /published_dates.json
  def create
    @published_date = PublishedDate.new(published_date_params)

    respond_to do |format|
      if @published_date.save
        format.html { redirect_to @published_date, notice: "Published date for the book [#{@published_date.book.title}] was successfully created." }
        format.json { render :show, status: :created, location: @published_date }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @published_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /published_dates/1 or /published_dates/1.json
  def update
    respond_to do |format|
      if @published_date.update(published_date_params)
        format.html { redirect_to @published_date, notice: "Published date for the book [#{@published_date.book.title}] was successfully updated." }
        format.json { render :show, status: :ok, location: @published_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @published_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /published_dates/1 or /published_dates/1.json
  def destroy
    @published_date.destroy!

    respond_to do |format|
      format.html { redirect_to published_dates_path, status: :see_other, notice: "Published date for the book [#{@published_date.book.title}] was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_published_date
      @published_date = PublishedDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def published_date_params
      params.require(:published_date).permit(:book_id, :publisher_id, :published_date, :edition)
    end

    def model_query
      query = PublishedDate.includes(:book, :publisher)
      if action_name == 'index'
        return query
      end

      if params[:book_id].present?
        query.where(book_id: params[:book_id])
      elsif params[:publisher_id].present?
        query.where(publisher_id: params[:publisher_id])
      else
        query
      end
    end
end
