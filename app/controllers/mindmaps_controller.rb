class MindmapsController < ApplicationController
  before_action :set_user
  before_action :set_mindmap, only: [:show, :edit, :update, :destroy]

  def new
    @mindmap = @user.mindmaps.build
  end

  def create
    @mindmap = @user.mindmaps.build(mindmap_params)
    if @mindmap.save
      flash[:notice] = "Mindmap has been created."
      redirect_to user_mindmaps_path
    else
      flash[:alert] = "Mindmap has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @mindmap.update(mindmap_params)
      flash[:notice] = "Mindmap has been updated."
      redirect_to [@user, @mindmap]
    else
      flash[:alert] = "Mindmap has not been updated."
      render action: "edit"
    end
  end


  def destroy
    @mindmap.destroy
    flash[:notice] = "Mindmap has been deleted."
    redirect_to @user
  end

  private
  def mindmap_params
    params.require(:mindmap).permit(:title)
  end



  private
  def set_user
    @user = User.find(params[:user_id])
  end

  private
  def set_mindmap
    @mindmap = @user.mindmaps.find(params[:id])
  end


end
