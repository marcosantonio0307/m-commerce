class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  def index
  	@products = Product.order :name
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new values
  	if @product.save
  	  redirect_to products_path, notice: 'Create!'
  	else
  	  render :new
  	end
  end

  def edit; end

  def update
  	if @product.update values
  	  redirect_to products_path, notice: 'Updated!'
  	else
  	  render :edit
  	end
  end

  def destroy
  	if @product.actived?
  	  @product.disabled!
  	  redirect_to products_path, notice: 'Disabled!'
  	else
  	  @product.actived!
  	  redirect_to products_path, notice: 'Actived'
  	end
  end

  private

  def values
  	params.require(:product).permit!
  end

  def set_product
  	@product = Product.find(params[:id])
  end
end
