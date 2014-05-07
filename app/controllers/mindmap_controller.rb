class MindmapController < ApplicationController

  before_filter :init_category_and_image_list

  def init_category_and_image_list
    @categories = Dir.entries("app/assets/images/lib/").select{ |category|
      category != "." && category != ".."
    }
    @image_list = {}
    for category in @categories
      @image_list[category] = Dir.glob("app/assets/images/lib/#{category}/*.*")
    end
  end

  def index
    @current_category = @categories[0]
  end

  def create
  end

  def load_lib_image
    @current_category = params[:category]
    respond_to do |format|
      format.js
    end
  end

  def delete
  end
end
