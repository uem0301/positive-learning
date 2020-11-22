class CollectionsController < ApplicationController
  before_action :transition_destination, only:[:new]

  def index
    @collections = Collection.includes(:user).order('created_at DESC')
    @collection = Collection.includes(:items).order('created_at DESC')
  end

  def new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collections_path      
    else
      render :new
    end
  end

  def edit
    # 編集時使用予定
    # @collection = Collection.find(params[:image])
  end

  def update
  end

  def show
    @item = Item.where(collection_id: params[:id])
    @collection = Collection.find(params[:id])
    @collections = Collection.includes(:user).order('created_at DESC')
  end

  def destroy
    collection = Collection.find(params[:id])
    if collection.present?
        items = Item.where(collection_id: collection.id)
        items.each do |item|
          item.destroy
        end
        collection.destroy
        redirect_to root_path, notice: "削除しました。"
    else
        redirect_to collections_path, notice: "削除できませんでした。"
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name,:explanation,:user_id,:image)
  end

  def transition_destination
    @collection = Collection.new
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
