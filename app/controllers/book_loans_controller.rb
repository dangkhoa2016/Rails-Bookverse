class BookLoansController < ApplicationController
  before_action :set_book_loan, only: %i[ show edit update destroy ]

  # GET /book_loans or /book_loans.json
  def index
    begin
      @pagy, @book_loans = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @book_loans = BookLoan.none
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

  def by_member
    # if params[:member_id].blank?
    #   raise ActionController::ParameterMissing.new('[member_id]')
    # end

    # Member.find(params[:member_id]) # check if the member is exists

    index

    render partial: "shared/records_list"
  end

  # GET /book_loans/1 or /book_loans/1.json
  def show
  end

  # GET /book_loans/new
  def new
    @book_loan = BookLoan.new
  end

  # GET /book_loans/1/edit
  def edit
  end

  # POST /book_loans or /book_loans.json
  def create
    @book_loan = BookLoan.new(book_loan_params)

    respond_to do |format|
      if @book_loan.save
        format.html { redirect_to @book_loan, notice: "Book loan for the book [#{@book_loan.book.title}] was successfully created." }
        format.json { render :show, status: :created, location: @book_loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_loans/1 or /book_loans/1.json
  def update
    respond_to do |format|
      if @book_loan.update(book_loan_params)
        format.html { redirect_to @book_loan, notice: "Book loan for the book [#{@book_loan.book.title}] was successfully updated." }
        format.json { render :show, status: :ok, location: @book_loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_loans/1 or /book_loans/1.json
  def destroy
    @book_loan.destroy!

    respond_to do |format|
      format.html { redirect_to book_loans_path, status: :see_other, notice: "Book loan for the book [#{@book_loan.book.title}] was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_loan
      @book_loan = BookLoan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_loan_params
      params.require(:book_loan).permit(:book_id, :member_id, :borrowed_on, :returned_on, :status, :active)
    end

    def model_query
      query = BookLoan.includes(:book, :member)
      if action_name == "index"
        return query
      end

      if params[:book_id].present?
        query.where(book_id: params[:book_id])
      elsif params[:member_id].present?
        query.where(member_id: params[:member_id])
      else
        query
      end
    end
end
