class ProfilesController < ApplicationController

  def show
      @profile = Profile.find(params[:id])
      @photos = @profile.photos
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      image_params.each do |image|
        @profile.photos.create(image: image)
      end

      redirect_to profile_path(@profile), notice: "Profile Created - Welcome!"
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    @photos = @profile.photos
  end

  def update
    if @profile.update(profile_params)
      image_params.each do |image|
        @profile.photos.create(image: image)
      end

      redirect_to profile_path(@profile), notice: "Details Updated!"
    else
      render :edit
    end
  end

  private

    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bio)
    end

    def image_params
      params[:images].present? ? params.require(:images) : []
    end
end
