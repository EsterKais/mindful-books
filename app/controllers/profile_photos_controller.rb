class ProfilePhotosController < ApplicationController

  def destroy
    @profilephoto = ProfilePhoto.find(params[:id])
    @profile = @profilephoto.profile

    @profilephoto.destroy

    redirect_to edit_profile_path(@profile), notice: "Photo successfully removed!"
  end

end
