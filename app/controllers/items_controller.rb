class ItemsController < ApplicationController
  before_action :transition_destination, only:[:new]
  before_action :Find_Id_InTheItem, only:[:edit,:update,:show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @tags = Tag.all
    @collection = Collection.new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      @tags = Tag.all
      render :new
    end
  end
  
  def edit
    @tags = Tag.all
  end

  def update
    @item.update((item_params))
    redirect_to items_path
  end

  def show
    @items = Item.where(id: params[:id])
  end

  def destroy
    item = find_item_by_id
    if item.present?
        item.destroy
        redirect_to root_path, notice: "削除しました。"
    else
        redirect_to items_path, notice: "削除できませんでした。"
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,:explanation,:image,:video,:user_id,:collection_id, tag_ids: [])
  end

  def find_item_by_id
    Item.find(params[:id])
  end

  def transition_destination
    @item = Item.new
    unless user_signed_in?
      redirect_to root_path
    end
  end  

  def Find_Id_InTheItem
    @item = find_item_by_id
  end
end
