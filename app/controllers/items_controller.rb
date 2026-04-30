class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  

  def index
    @items = Item.all
  end



  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)

    if params[:item][:image]
      @item.image_path = save_image(params[:item][:image])
    end

    if @item.save
      redirect_to @item, notice: "Item created successfully"
    else
      render :new
    end
  end



  def update
    if params[:item][:image]
      @item.image_path = save_image(params[:item][:image])
    end

    if @item.update(item_params.except(:image))
      redirect_to @item, notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to dashboard_path, notice: "Deleted successfully"
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_user!
    redirect_to dashboard_path, alert: "Not allowed" unless @item.user == current_user
  end

  def item_params
    params.require(:item).permit(:title, :description, :status, :is_resolved, :image_path)
  end

  # Save image manually into public/images
  def save_image(uploaded_file)
    filename = "#{Time.now.to_i}_#{uploaded_file.original_filename}"
    path = Rails.root.join("public", "images", filename)

    File.open(path, "wb") do |file|
      file.write(uploaded_file.read)
    end

    "/images/#{filename}"
  end
end