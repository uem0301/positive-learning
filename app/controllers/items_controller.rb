class ItemsController < ApplicationController
  before_action :transition_destination, only:[:new]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @collection = Collection.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      reder :new
    end
  end
  
  def edit
    # 編集時使用予定
    # @item = Item.find(params[:image,:video])
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title,:explanation,:image,:video,:user_id,:collection_id)
  end

  def transition_destination
    @item = Item.new
    unless user_signed_in?
      redirect_to root_path
    end
  end  
end
