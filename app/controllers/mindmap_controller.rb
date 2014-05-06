class MindmapController < ApplicationController
  def index
    @image_list = Dir.glob("app/assets/images/lib/animal/*.*")
  end

  def create
  end

  def update
  end

  def delete
  end
end
