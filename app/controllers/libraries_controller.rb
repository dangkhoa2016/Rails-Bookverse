class LibrariesController < ApplicationController
  before_action :set_library, only: %i[ show edit update destroy ]

  # GET /libraries or /libraries.json
  def index
    begin
      @pagy, @libraries = pagy(Library)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @libraries = Library.none
      else
        raise e
      end
    end

    if @libraries.present?
      members_count = Member.count_by_library_ids(@libraries.pluck(:id))
      @libraries.each do |library|
        library.members_count = members_count[library.id] || 0
      end
    end
  end

  # GET /libraries/1 or /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @library = Library.new
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries or /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: "Library [#{@library.name}] was successfully created." }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1 or /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to @library, notice: "Library [#{@library.name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1 or /libraries/1.json
  def destroy
    @library.destroy!

    respond_to do |format|
      format.html { redirect_to libraries_path, status: :see_other, notice: "Library [#{@library.name}] was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:name, :address, :active)
    end
end
