class AuthorProfilesController < ApplicationController
  include DeleteConcern
  before_action :set_author_profile, only: %i[ show edit update destroy ]

  # GET /author_profiles or /author_profiles.json
  def index
    begin
      @pagy, @author_profiles = pagy(model_query)
    rescue => e
      if e.is_a?(Pagy::OverflowError)
        @pagy = Pagy.new(count: 0)
        @author_profiles = AuthorProfile.none
      else
        raise e
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

  # GET /author_profiles/1 or /author_profiles/1.json
  def show
  end

  # GET /author_profiles/new
  def new
    @author_profile = AuthorProfile.new
  end

  # GET /author_profiles/1/edit
  def edit
  end

  # POST /author_profiles or /author_profiles.json
  def create
    @author_profile = AuthorProfile.new(author_profile_params)

    respond_to do |format|
      if @author_profile.save
        format.html { redirect_to @author_profile, notice: "Profile for the author [#{@author_profile.author.full_name}] was successfully created." }
        format.json { render :show, status: :created, location: @author_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_profiles/1 or /author_profiles/1.json
  def update
    respond_to do |format|
      if @author_profile.update(author_profile_params)
        format.html { redirect_to @author_profile, notice: "Profile for the author [#{@author_profile.author.full_name}] was successfully updated." }
        format.json { render :show, status: :ok, location: @author_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_profile
      begin
        @author_profile = AuthorProfile.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash.now[:alert] = "Author profile with ID [#{params[:id]}] not found."
      end
    end

    # Only allow a list of trusted parameters through.
    def author_profile_params
      params.require(:author_profile).permit(:author_id, :bio, :social_facebook, :social_twitter, :social_instagram, :social_linkedin, :social_youtube, :active)
    end

    def model_query
      query = AuthorProfile.includes(:author)
      if action_name == 'index'
        return query
      end

      if params[:author_id].present?
        query.where(author_id: params[:author_id])
      else
        query
      end
    end
end
