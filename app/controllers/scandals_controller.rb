class ScandalsController < ApplicationController
  before_action :find_scandal, only: [:show, :edit, :update, :destroy]
  def index
    @scandals = Scandal.all 
  end

  def new
    @scandal = Scandal.new 
  end

  def create
    @scandal = Scandal.new(scandal_params)
      if @scandal.save 
        redirect_to scandal_path 
      else
        render :new 
      end
  end

  def show
  end

  def edit
  end

  def update 
    if @scandal.update(scandal_params)
      redirect_to scandal_path 
    else
      render :edit 
    end
  end

  def destroy
    @scandal.destroy 
    redirect_to scandals_path 
  end


  private

  def find_scandal
    @scandal = Scandal.find(params[:id])
  end

  def scandal_params 
    params.require(:scandal).permit(:title, :content, :photographic_evidence, :user_id)
  end

end
