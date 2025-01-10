class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      flash.now[:alert] = "Failed to create product. Please check the input."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated successfully."
    else
      flash.now[:alert] = "Failed to update product. Please check the input."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: "Product deleted successfully."
    else
      redirect_to products_path, alert: "Failed to delete product."
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name, :description, :featured_image, :inventory_count ])
    end
end
