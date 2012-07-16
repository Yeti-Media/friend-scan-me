class ProductsController < ApplicationController
  before_filter :authenticate_user , :except => [:show, :like]

  def index
    @products = @current_user.products.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find_by_slug(params[:id])
    custom_og_tags
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def new
    @product = @current_user.products.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    @product = @current_user.products.find_by_slug(params[:id])
  end

  def create
    @product = @current_user.products.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = @current_user.products.find_by_slug(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = @current_user.products.find_by_slug(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

  def like 
    @product = Product.find_by_slug(params[:id])
    @product.update_attribute :likes , @product.likes + 1
    render text: ""
  end

  private

  def custom_og_tags
    @og_description = @product.description
    @og_title = @product.name
    @og_url =  product_url(@product)
    @og_icon = @product.asset.icon.url
  end
end
