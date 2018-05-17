class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all.order(:name)
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  def home
    @restaurants = Restaurant.all.order(:name)
    @restaurantsJoin = Restaurant.joins("INNER JOIN dishes ON dishes.restaurant_id = restaurants.id") unless params[:category_id].blank?
    @restaurants = @restaurantsJoin.where("category_id = :cat", {cat: params[:category_id]}) unless params[:category_id].blank?
    @restaurants = Restaurant.where("UPPER(name) LIKE ?", "%#{params[:search_term].to_s.upcase}%") unless params[:search_term].blank?
    @restaurantsJoin = Restaurant.joins("INNER JOIN dishes ON dishes.restaurant_id = restaurants.id") unless params[:search_term_dish].blank?
    @restaurants = @restaurantsJoin.where("UPPER(dishes.name) LIKE ?", "%#{params[:search_term_dish].to_s.upcase}%") unless params[:search_term_dish].blank?
  end

  def restaurant
    @selected_restaurant = Restaurant.new unless params[:restaurant_id].present?
    @selected_restaurant = Restaurant.find params[:restaurant_id] unless params[:restaurant_id].blank?
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :phone, :address)
    end
end
