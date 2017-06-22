class PawnsController < ApplicationController

  def index
    @pawns = Pawn.all
  end

  def new
    @pawn = Pawn.new  
  end

  def edit
    @pawn = Pawn.find(params[:id])
  end

  def search
    @pawn = Pawn.find(params[:id])
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


  private
  def pawn_params
    params.require(:pawn).permit(:pawn_number, :name, :principle)
  end
end
