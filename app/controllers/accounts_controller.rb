class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    accounts = current_user.accounts
    render json: accounts
  end
  
  def create
    account = Account.new(account_params)
    if(account.valid?)
      account.save
      render json: account
    else
      render json: {errors: account.errors.full_messages}
    end
  end

  def show
    account = Account.find(params[:id])
    render json: account.to_json(
             :include => [
               :albums => {:methods => :cover_art},
               :songs => {:methods => :song_url, :include => [
                            :album => {:methods => :cover_art}
                          ]
                         }
           ]
)
  end

  private

  def account_params
    params.require(:account).permit(:account_name).merge(user_id: current_user.id)
  end
end
