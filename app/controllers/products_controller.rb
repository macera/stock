class ProductsController < ApplicationController
  before_action :set_supply, only: [:index, :new, :create]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = @supply.products
    #@products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    #@product = Product.new
    if @supply.products.last
      @product = @supply.products.last.dup
      # @product.purchased_date = nil
      # @product.start_date = nil
      @product.end_date = nil
    else
      @product = @supply.products.build
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = @supply.products.build(product_params)
    respond_to do |format|
      if @product.save
        set = params[:product_set].to_i
        if set > 1
          (set - 1).times do
            @supply.products.create!(product_params)
          end
        end
        format.html { redirect_to supply_path(@supply), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to supplies_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
  end

  def finish
  end

  def less
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_supply
      @supply = Supply.find(params[:supply_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :purchased_date, :start_date, :end_date, :quantity, :quantity_type, :less, :memo, :shop_id)
    end
end
