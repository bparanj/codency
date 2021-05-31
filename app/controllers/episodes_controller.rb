class EpisodesController < ApplicationController  
  def index
    respond_to do |format|
      format.html do
        @episodes = Episode.all
      end
      format.rss do
        # Episode.published
        @episodes = Episode.all
      end
    end
  end

  def show
    set_episode
  end

  def new
    @episode = Episode.new
    @episode.link = 'http://media.rubyplus.com/' 
    # @episode.sequence = Episode.maximum(:sequence) + 1
    @date = Date.today
  end

  def edit
    set_episode
    @link = if @episode.link.present? 
      @episode.link
    else
      'http://media.rubyplus.com/.mp4' 
    end
    
    @date = @episode.published_at
  end

  def create
    @episode = Episode.new(episode_params)
    
    if @episode.save
      redirect_to @episode, notice: 'Episode was successfully created.'
    else
      render :new
    end
  end

  def update
    set_episode
    if @episode.update(episode_params)
      redirect_to @episode, notice: 'Episode was successfully updated.'
    else
      render :edit
    end    
  end
  
  private
  
  def set_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:title, :description, :link, :duration, :published_at, :file_size, :sequence)
  end
end