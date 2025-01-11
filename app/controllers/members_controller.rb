class MembersController < ApplicationController
  include DeleteConcern
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    begin
      @pagy, @members = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @members = Member.none
      else
        raise e
      end
    end

    if @members.present?
      book_loans_count = BookLoan.count_by_model_ids(:member, @members.pluck(:id))
      @members.each do |member|
        member.book_loans_count = book_loans_count[member.id] || 0
      end
    end
  end

  def by_library
    # if params[:library_id].blank?
    #   raise ActionController::ParameterMissing.new('[library_id]')
    # end

    # Library.find(params[:library_id]) # check if the library is exists

    index

    render partial: "shared/records_list"
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: "Member [#{@member.full_name}] was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: "Member [#{@member.full_name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :email, :library_id, :active)
    end

    def model_query
      query = Member.includes(:library)
      if action_name == "index"
        return query
      end

      if params[:library_id].present?
        query.where(library_id: params[:library_id])
      else
        query
      end
    end
end
