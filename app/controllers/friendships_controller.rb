class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend!"
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_path
    end

  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Friend removed!"
    redirect_to profile_path(current_user.profile.id)
  end

end
