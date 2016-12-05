class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @profiles = Profile.all
  end

  def show
      @profile = Profile.find(params[:id])
      @profilephoto = @profile.profile_photo
      @products = @profile.user.products.all

# START: FRIEND SYSTEM
      @friendships = current_user.friendships.all
      @inverse_friendships = current_user.inverse_friendships.all
      @mutual_friends = []
      @friend_requests = []
      @pending_requests = []

      @friendships.each do |friendship|
        @mutual_friends.concat(@inverse_friendships.where("user_id = ?", friendship.friend_id))
      end

      @inverse_friendships.each do |inverse_friendship|
      # start: if mutual_friends array is empty, automatically push to friend_requests array
        if @mutual_friends.length > 0
          match = @mutual_friends.find { |mutual_friend| mutual_friend.user_id == inverse_friendship.user_id }
          if match == nil
            @friend_requests.push(inverse_friendship)
          end
        else
          @friend_requests.push(inverse_friendship)
        end
      # end: if mutual_friends array is empty, automatically push to friend_requests array
      end

      @friendships.each do |friendship|
        if @mutual_friends.length > 0
          match = @mutual_friends.find { |mutual_friend| mutual_friend.user_id == friendship.friend_id }
          if match == nil
            @pending_requests.push(friendship)
          # else
          #   @pending_requests.delete(friendship)
          end
        else
          @pending_requests.push(friendship)
        end
      end

# END: FRIEND SYSTEM

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
