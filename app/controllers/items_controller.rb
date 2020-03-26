class ItemsController < ApplicationController
  before_action :set_item ,only: [:show, :check, :edit, :update, :delete, :item_destroy, :buycomp]

  require 'payjp'

  def top_page
    @item = Item.recent
    @photo = Photo.includes(:item).recentimg
    @mens = Item.category(149..237).recent
    @ladies = Item.category(45..148).recent
    @game = Item.category(277..295).recent
    @camera = Item.category(378..399).recent
    @car = Item.category(450..476).recent
  end

  def show
  end

  def new
    @item = Item.new
    @item.photos.new
    @item.build_brand
    @item.build_category
    @category = Category.order("id ASC").limit(13)
  end

  def create
    @item = Item.new(item_params)
    if params[:item][:photos_attributes] != nil
      @item.save
    else
      redirect_to new_item_path
    end
  end

  def get_category_children
    @category_children = Category.find(params[:category_value]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:category_value]).children
  end

  def cal_profit
    @price = params[:price].to_i
    @sales_commission = (@price * 0.1).to_i
    @profit = (@price * 0.9).to_i
  end

  def check
  end

  def edit
    @category = Category.order("id ASC").limit(13)
    @selected_category = Category.find(@item.category_id)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def delete
  end

  def item_destroy
    if @item.destroy
      redirect_to root_path
    else
      render action: 'show'
    end
  end

  def sellcomp
  end

  def buycomp
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @item.update(buyer_id: current_user.id)
  end

  def purchase
  end
  
  private

  def item_params
    params.require(:item).permit(:user_id, :cost, :situation, :image, :photo, :category_id, :deliver_area, :shipping_term, :name, :text, :price, :size, brand_attributes: [:id, :name], category_attributes: [:id, :name], photos_attributes: [:id, :url, :_destroy]).merge(user_id: current_user.id, seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
