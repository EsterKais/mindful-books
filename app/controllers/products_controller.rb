class ProductsController < ApplicationController

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)

      redirect_to profile_path(@product.user.profile.id), notice: "Addition updated!"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to profile_path(@product.user.profile.id), notice: "Addition successfully removed!"
  end


  private

  def product_params
    params.require(:product).permit(:name, :description)
  end

end
