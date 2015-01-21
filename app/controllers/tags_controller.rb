class TagsController < ApplicationController

  def index
    @tags = Tag.all
     tag = Tag.find_by_name(params[:tag])
  end

  def new
    @tags = Tag.new
  end

  def create
    @tags = Tag.new(tag_params)
    @tags.save
    redirect_to tags_path
  end

  def destroy
    creature_id = Tag.find_by_name(params[:tag])
    unless creature_id
    @tags = Tag.find_by_id(params[:id]).destroy
    redirect_to tags_path
    else
    render :plain => 'Tag in use by creature'
    end
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
