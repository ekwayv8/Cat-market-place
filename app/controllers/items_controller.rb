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
    @item = Item.new(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
      if @item.save
        redirect_to item_path(@item.id)
      else
        render 'new'
      end
  end

  def update
  
  end

  def destroy
    @item = Item.destroy

  end

end