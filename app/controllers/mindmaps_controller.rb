class MindmapsController < ApplicationController
   before_action :init_category_and_image_list
  before_action :set_user
  before_action :set_mindmap, only: [:show, :edit, :update, :destroy]

  def new
    @mindmap = @user.mindmaps.build
  end

  def create
    @mindmap = @user.mindmaps.build(mindmap_params)
    if @mindmap.save
      redirect_to user_mindmaps_path
    else
      flash[:alert] = 'Mindmap has not been created.'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @mindmap.update(mindmap_params)
      flash[:notice] = 'Mindmap has been updated.'
      redirect_to [@user, @mindmap]
    else
      flash[:alert] = 'Mindmap has not been updated.'
      render action: 'edit'
    end
  end

  def destroy
    @mindmap.destroy
    flash[:notice] = 'Mindmap has been deleted.'
    redirect_to @user
  end

  def load_lib_image
    return unless @current_category == params[:category]
    @current_category = params[:category]
    respond_to do |format|
      format.js
    end
  end

    def init_category_and_image_list
    @categories = Dir.entries('app/assets/images/lib/').select do |category|
      category != '.' && category != '..'
    end
    @image_list = {}
    @categories.each do |category|
      @image_list[category] = Dir.glob("app/assets/images/lib/#{category}/*.*")
    end
    @current_category = @categories[0]
  end

  private
  def mindmap_params
    params.require(:mindmap).permit(:title)
  end

  def set_user
    @user = current_user
  end

  def set_mindmap
    @mindmap = @user.mindmaps.find(params[:id])
  end
end
