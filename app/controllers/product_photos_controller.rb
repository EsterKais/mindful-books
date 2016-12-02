class ProductPhotosController < ApplicationController

  def destroy
    @productphoto = ProductPhoto.find(params[:id])
    @product = @productphoto.product

    @productphoto.destroy

    redirect_to edit_product_path(@product), notice: "Photo successfully removed!"
  end

end
