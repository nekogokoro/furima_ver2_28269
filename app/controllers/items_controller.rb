class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    @category = Category.all
    @status = Status.all
    @area = Area.all
    @deli_fee = DeliFee.all
    @deli_day = DeliDay.all
  end

  def create
    Item.create(image: params[:image], name: params[:name], description: params[:description], user_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description,:price).merge(user_id: current_user.id)
  end
end