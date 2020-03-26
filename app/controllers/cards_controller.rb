class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    redirect_to action: "index" if @card.present?
  end

  def create #PayjpとCardのデータベースを作成

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      if params['payjp-token'].blank?
        redirect_to action: "new"
      else
        # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
        customer = Payjp::Customer.create(
          description: 'test',
          email: current_user.email,
          card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
          metadata: {user_id: current_user.id}
        )
        @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

        if @card.save
          redirect_to action: "index"
        else
          redirect_to action: "create"
        end
      end
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end

