class ItemsController < ApplicationController
  before_action :transition_destination, only:[:new]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @tags = Tag.all
    @collection = Collection.new
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
    # 編集時使用予定
    # @item = Item.find(params[:image,:video])
  end

  def update
    respond_to do |format|
      if @item.update(article_params) && @item.video.recreate_versions!
        format.html { redirect_to @item, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @item = Item.where(id: params[:id])
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title,:explanation,:image,:video,:user_id,:collection_id, tag_ids: [])
  end

  def transition_destination
    @item = Item.new
    unless user_signed_in?
      redirect_to root_path
    end
  end  
end
