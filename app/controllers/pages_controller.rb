class PagesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]  

  def index
    @collections = Collection.includes(:items).order('created_at DESC')
    @items = Item.order('created_at DESC')
    @search = Item.ransack(params[:q])
    @search_items = @search.result(distinct: true)
  end

  def show
    # @collection = Collection.find(params[:id])
    # @item = Item.find(params[:id])
  end
  
  private
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
