class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    @profile = @photo.profile

    @photo.destroy

    redirect_to edit_profile_path(@profile), notice: "Photo successfully removed!"
  end

end
