class PublishersController < ApplicationController
  include DeleteConcern
  before_action :set_publisher, only: %i[ show edit update destroy ]

  # GET /publishers or /publishers.json
  def index
    begin
      @pagy, @publishers = pagy(Publisher)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @publishers = Publisher.none
      else
        raise e
      end
    end

    if @publishers.present?
      published_dates_count = PublishedDate.count_by_model_ids(:publisher, @publishers.pluck(:id))
      @publishers.each do |publisher|
        publisher.published_dates_count = published_dates_count[publisher.id] || 0
      end
    end
  end

  # GET /publishers/1 or /publishers/1.json
  def show
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers or /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: "Publisher [#{@publisher.name}] was successfully created." }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1 or /publishers/1.json
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, notice: "Publisher [#{@publisher.name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publisher_params
      params.require(:publisher).permit(:name, :address, :phone_number, :email, :established_year, :website, :ceo_name, :active)
    end
end
