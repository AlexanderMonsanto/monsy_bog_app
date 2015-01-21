class CreaturesController < ApplicationController
  before_action :locate_creature, only: [:edit, :update, :show, :destroy]
  attr_accessor :name, :desc

  def index
    @name = Creature.all
  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    @creature = Creature.new(creature_params)
    @tags = Tag.all
    if @creature.save

      @creature.tags.clear
      tags = params[:creature][:tag_ids].split(",")
      tags.each do |tag_id|
      @creature.tags << Tag.find_or_create_by({name:tag_id}) unless tag_id.blank?
      end

      flash[:success] = "Your creature has been added"
      redirect_to '/creatures'
    else
      render :action => :new
    end
  end

  def show
    @creature = Creature.find_by_id(params[:id])

    return render :plain => 'error no creature' unless @creature



    @search = @creature.name
    list = flickr.photos.search :text => @search, :sort => 'relevance'

    @results = list.map do |photo|
    [FlickRaw.url_s(photo),
    FlickRaw.url_b(photo)]
    end
  end

  def edit
    @tags = Tag.all
    @creature = Creature.find(params[:id])
  end

  def update

    @creature = Creature.find_by_id(params[:id])
    @creature.update_attributes(creature_params)
    @creature.save

    @creature.tags.clear
    tags = params[:creature][:tag_ids].split(",")
    tags.each do |tag_id|
      @creature.tags << Tag.find_or_create_by({name:tag_id}) unless tag_id.blank?
    end

    redirect_to creatures_path
  end

  def destroy
    @creature = Creature.find_by_id(params[:id]).destroy
    redirect_to "/creatures"
  end

  def tag
    # @name = Tag.all
    tag = Tag.find_by_name(params[:tag])
    @name = tag ? tag.creatures : []
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :desc)
  end

  def locate_creature
    redirect_to '/404.html' unless @creature = Creature.find_by_id(params[:id])
  end

end
