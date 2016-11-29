class ProfilesController < ApplicationController

  def show
      @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile Created - Welcome!"
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    if @profile.update(profile_params)
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
end
