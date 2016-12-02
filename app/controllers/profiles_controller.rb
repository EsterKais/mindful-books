class ProfilesController < ApplicationController

  def show
      @profile = Profile.find(params[:id])
      @profilephoto = @profile.profile_photo
      @products = current_user.products.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    # note: @product = current_user.products.build(product_params)

    if @profile.save
      image_params.each do |image|
        @profile.profile_photo.create(image: image)
      end

      redirect_to profile_path(@profile), notice: "Profile Created - Welcome!"
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    # could be set_product - DRY
    @profilephoto = @profile.profile_photo
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      image_params.each do |image|
        @profile.create_profile_photo(image: image)
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
