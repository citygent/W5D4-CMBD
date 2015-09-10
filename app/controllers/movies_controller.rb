class MoviesController < ApplicationController
   skip_before_action :verify_authenticity_token
  
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    # binding.pry
    if @movie.save
      redirect_to("/movies/#{@movie.id}")
    else
      render :new
    end
  end

  def show
    @movie = Movie.find params[:id]
    # binding.pry
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to("/movies/#{@movie.id}")
    else
      render :edit
    end
  end

  def delete
    @movie = Movie.find(params[:id])
    if @member.destroy
      redirect_to("/movies")
    else
      ("/movies/#{@movie.id}")
    end
  end

private

  def movie_params
    params.require(:movie).permit(:Title, :Director, :Poster, :Plot)
  end

end