class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
      title: params[:movie][:title],
      release_year: params[:movie][:release_year],
      synopsis: params[:movie][:synopsis],
      origin: params[:movie][:origin],
      length: params[:movie][:length],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id]
    )

    if @movie.save
      flash[:notice] = 'Novo filme cadastrado com sucesso!'
      return redirect_to movie_path(@movie.id)
    end

    render :new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(
      title: params[:movie][:title],
      release_year: params[:movie][:release_year],
      synopsis: params[:movie][:synopsis],
      origin: params[:movie][:origin],
      length: params[:movie][:length],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id]
    )
      flash[:notice] = 'Dados atualizados!'
      return redirect_to movie_path(@movie.id)
    end

    render :edit
  end
end
