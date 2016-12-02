class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    # note: @product = current_user.products.build(product_params)

    if @product.save
      redirect_to profile_path(@product.user.profile.id), notice: "Addition Created - Thank you!"
    else
      render :new
    end
  end

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
