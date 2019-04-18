class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /products
  # GET /products.json
  def index
    params[:page] = params[:page].present? ? params[:page] : 1

    @products_details = Product.select(:brand,:model,:ram,:external_storage)#.uniq#.collect{|a| ["#{a.brand}", "a.brand"]}
    @brand = @products_details.pluck(:brand).uniq.sort
    @model = @products_details.pluck(:model).uniq.sort
    @ram = @products_details.pluck(:ram).uniq.sort
    @extst = @products_details.pluck(:external_storage).uniq.sort
    @selected_brand = params[:select_brand].present? ? params[:select_brand] : ''
    @selected_model = params[:select_model].present? ? params[:select_model] : ''
    @selected_ram = params[:select_ram].present? ? params[:select_ram] : ''
    @selected_extst = params[:select_extst].present? ? params[:select_extst] : ''

    condition = []
    if params[:select_brand].present?
       condition << " brand = '#{params[:select_brand]}'"
    end

    if params[:select_model].present?
       condition << " model = '#{params[:select_model]}'"
    end

    if params[:select_ram].present?
       condition << " ram = #{params[:select_ram]}"
    end

    if params[:select_extst].present?
       condition << " external_storage = #{params[:select_extst]}"
    end
    if condition != []
      @products = Product.where(condition).order('created_at desc').page params[:page]
    else
      @products = Product.all.order('created_at desc').page params[:page]
    end
  end

  def export
    @products = Product.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_products.xlsx"'
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
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
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
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
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_type,:product_name,:model,:brand,:year,:ram,:internal_storage,:external_storage)
    end
end
