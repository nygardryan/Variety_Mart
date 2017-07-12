class PawnsController < ApplicationController
  before_action :require_login
  before_action :set_pawn, only: [:show]

  Stripe.api_key = ENV['SECRET_KEY']


  def index
    @pawns = Pawn.all
    if params[:search_number]
      @pawns = Pawn.find_by(pawn_number: params[:search_number])
    else
      @pawns = Pawn.all.order("created_at DESC")
    end
  end

  def new
    @pawn = Pawn.new  
  end

  def edit
    @pawn = Pawn.find(params[:id])
  end
  

  def search
    if params[:search_number] && params[:search_name]
      @pawn = Pawn.find_by(pawn_number: params[:search_number])
      if @pawn.name === params[:search_name]
        redirect_to @pawn
      end
    end
  end

  def create
    @pawn = Pawn.new(pawn_params)
   
    if @pawn.save
      redirect_to @pawn
    else
      render 'new'
    end
  end

  def show
    @pawn = Pawn.find(params[:id])
  end

  def update
    @pawn = Pawn.find(params[:id])
   
    if @pawn.update(pawn_params)
      redirect_to @pawn
    else
      render 'edit'
    end
  end

  def destroy
    @pawn = Pawn.find(params[:id])
    @pawn.destroy
   
    redirect_to pawns_path
  end

  def set_pawn
    if Pawn.find(params[:id])
      @pawn = Pawn.find(params[:id])
    end
  end

  private
  def require_login
    unless admin_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path # halts request cycle
    end
  end

  def pawn_params
    params.require(:pawn).permit(:pawn_number, :name, :principle)
  end
end
