class MenuItemsController < ApplicationController
  before_action :authenticate_user!, :set_menu
  before_action :set_menu_item, only: %i[ show edit update destroy ]
  after_action :verify_authorized, except: :index

  # GET /menu_items or /menu_items.json
  def index
    @menu_items = @menu.menu_items
  end

  # GET /menu_items/1 or /menu_items/1.json
  def show
  end

  # GET /menu_items/new
  def new
    @menu_item = authorize MenuItem.new
  end

  # GET /menu_items/1/edit
  def edit
  end

  # POST /menu_items or /menu_items.json
  def create
    @menu_item = authorize @menu.menu_items.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to menu_menu_item_path(@menu, @menu_item), notice: "Menu item was successfully created." }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1 or /menu_items/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to menu_menu_item_path(@menu, @menu_item), notice: "Menu item was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1 or /menu_items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_menu_items_url(@menu), notice: "Menu item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item ||= authorize @menu.menu_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_item_params
      params.require(:menu_item).permit(:title, :description, :price, :image)
    end
    
    def set_menu
      @menu ||= Menu.find(params[:menu_id])
    end
end
