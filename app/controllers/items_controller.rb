class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all   
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to item_path
      else
        render 'new'
      end
  end

  def update
  
  end

  def destroy
    @item = Item.destroy

  end

private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url)
  end

end
