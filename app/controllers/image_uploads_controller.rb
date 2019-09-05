class ImageUploadsController < ApplicationController
  def create
  	@item = Item.new(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_upload])
      if @item.save
      	@item.image_upload.attach(params[:image_upload])
        redirect_to item_path(@item.id)
      else
        render new_item_path
      end
  end
end
