class SignupsController < ApplicationController
  before_action :validates_new, only: :address
  before_action :validates_address, only: :create
  def index
    @user = User.new
  end
  
  def new
    @user = User.new
  end
  
  def address
    @address = Address.new
  end

  def validates_address
    @user = User.new
  end
  
  
  
  def create   
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password:session[:password],
      password_confirmation:session[:password_confirmation],
      lastname_kanji:session[:lastname_kanji],
      firstname_kanji:session[:firstname_kanji],
      lastname_katakana:session[:lastname_katakana],
      firstname_katakana:session[:firstname_katakana],
      birth_year:session[:birth_year],
      birth_month:session[:birth_month],
      birth_day:session[:birth_day],
      tel:session[:tel]
      )

      unless @user.valid?
        return render '/signups/address'
      end

      @user.save
      session[:id] = @user.id
      @address = Address.create(
        user:@user,
        postcode:session[:postcode],
        prefecture_id:session[:prefecture_id],
        cities:session[:cities],
        blocks:session[:blocks],
        builds:session[:builds]
        )
        redirect_to complete_signups_path
        
      end
      
      
      def complete
        sign_in User.find(session[:id]) unless user_signed_in?
      end
      
      def credit_card
      end
      
      def login
        @user = User.find_by(email: user_params[:email], password: user_params[:password])
        if @user
          flash[:notice] = "ログインしました"
          redirect_to("items/top_page")
        else
          render("signups/login")
        end

      end
      
      
    private
      def user_params
        params.require(:user)
        .permit(:nickname,
        :email,
        :password, 
        :password_confirmation, 
        :lastname_kanji,
        :firstname_kanji,
        :lastname_katakana,
        :firstname_katakana,
        :tel,
        address_attributes:[:id,:postcode,:prefecture_id,:cities,:blocks,:builds]
        )
      end
      
      
      def address_params
        params.require(:address)
        .permit(
          :postcode,
          :prefecture_id,
          :cities,
          :blocks,
          :builds)
      end
        
      def validates_new
        session[:nickname]              = user_params[:nickname]
        session[:email]                 = user_params[:email]
        session[:password]              = user_params[:password]
        session[:password_confirmation] = user_params[:password_confirmation]
        session[:lastname_kanji]        = user_params[:lastname_kanji]
        session[:firstname_kanji]       = user_params[:firstname_kanji]
        session[:lastname_katakana]     = user_params[:lastname_katakana]
        session[:firstname_katakana]    = user_params[:firstname_katakana]
        session[:birth_year]            = params[:birthday]["birthday(1i)"]
        session[:birth_month]           = params[:birthday]["birthday(2i)"]
        session[:birth_day]             = params[:birthday]["birthday(3i)"]
        session[:tel]                   = user_params[:tel]
        @user = User.new(
          nickname: session[:nickname], 
          email: session[:email],
          password: session[:password],
          password_confirmation: session[:password_confirmation],
          lastname_kanji:session[:lastname_kanji],
          firstname_kanji:session[:firstname_kanji],
          lastname_katakana:session[:lastname_katakana],
          firstname_katakana:session[:firstname_katakana],
          birth_year:session[:birth_year],
          birth_month:session[:birth_month],
          birth_day:session[:birth_day],
          tel:session[:tel]
          )
     unless @user.valid?(:validates_new)
      render '/signups/new'
     end
    end
      
    def validates_address
      session[:postcode]                = address_params[:postcode]
      session[:prefecture_id]           = address_params[:prefecture_id]
      session[:cities]                  = address_params[:cities]
      session[:blocks]                  = address_params[:blocks]
      session[:builds]                  = address_params[:builds]
      @user = User.new
      @address= Address.new(
        user:@user,
        postcode:session[:postcode],
        prefecture_id:session[:prefecture_id],
        cities:session[:cities],
        blocks:session[:blocks]
        )
        render '/signups/address' unless @address.valid?(:validates_address)
    end
    
    def validates_tel
      @user = User.new(
        tel:session[:tel]
      )
      render '/signups/tel' unless @user.valid?(:validates_tel)
    end
    
end  