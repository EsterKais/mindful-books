class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @productphoto = @product.product_photo
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    # note: @product = current_user.products.build(product_params)

    if @product.save
      image_params.each do |image|
        @product.product_photo.create(image: image)
      end

      redirect_to profile_path(@product.user.profile.id), notice: "Addition Created - Thank you!"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @product.user.id
      @product = Product.find(params[:id])
      @productphoto = @product.product_photo
    else
      redirect_to root_path, notice: "You don't have permission!"
    end

  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      image_params.each do |image|
        @product.create_product_photo(image: image)
      end

      redirect_to profile_path(@product.user.profile.id), notice: "Addition updated!"
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @product.user.id
      @product = Product.find(params[:id])
      @product.destroy

      redirect_to profile_path(@product.user.profile.id), notice: "Addition successfully removed!"
    else
      redirect_to root_path, notice: "You don't have permission!"
    end

  end


  private

  def product_params
    params.require(:product).permit(:name, :description)
  end

  def image_params
    params[:images].present? ? params.require(:images) : []
  end

end
