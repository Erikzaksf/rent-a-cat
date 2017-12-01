class CatsController < ApplicationController
  def index
    @cats = Cat.recent
  end

  def show
    @cat = Cat.find(params[:id])
    @comment = @cat.comments.new
  end

  def new
    authorize
    @cat.user.admin === true
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user.admin === true
    if @cat.save
      flash[:notice] = "Cat posted successfully!"
      redirect_to cat_path(@cat)
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    if @cat.user == current_user
      render :edit
    else
      flash[:alert] = "You aren't authorized to access that."
      redirect_to cat_path(@cat)
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.user.admin === true
      if @cat.update(cat_params)
        flash[:notice] = "Cat updated successfully!"
        redirect_to cat_path(@cat)
      else
        flash[:alert] = "Something went wrong!"
        render :edit
      end
    else
      flash[:alert] = "You aren't authorized to do that."
      redirect_to cat_path(@cat)
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.user.admin === true
      @cat.comments.each do |comment|
        comment.destroy
      end
      @cat.destroy
      flash[:notice] = "Cat deleted successfully!"
      redirect_to cats_path
    else
      flash[:alert] = "You aren't authorized to do that."
      redirect_to cat_path(@cat)
    end
  end

private
  def cat_params
    params.require(:cat).permit(:name, :about, :traits, :price)
  end
end
