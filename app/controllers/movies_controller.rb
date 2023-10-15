class MoviesController < ApplicationController
  def index
    @released = Movie.released
    @not_released = Movie.not_released
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
      title: params[:movie][:title],
      release_date: params[:movie][:release_date],
      release_year: params[:movie][:release_date].to_date.year,
      synopsis: params[:movie][:synopsis],
      origin: params[:movie][:origin],
      length: params[:movie][:length],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id],
      status: check_release_status(params[:movie][:release_date])
    )

    if @movie.save
      flash[:notice] = 'Novo filme cadastrado com sucesso!'
      return redirect_to movie_path(@movie.id)
    end

    render :new
  end

  def show
    @movie = Movie.find(params[:id])
    @status = 'Não lançado'
    @status = 'Lançado' if @movie.status == 'released'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(
      title: params[:movie][:title],
      release_date: params[:movie][:release_date],
      release_year: params[:movie][:release_date].to_date.year,
      synopsis: params[:movie][:synopsis],
      origin: params[:movie][:origin],
      length: params[:movie][:length],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id],
      status: check_release_status(params[:movie][:release_date])
    )
      flash[:notice] = 'Dados atualizados!'
      return redirect_to movie_path(@movie.id)
    end

    render :edit
  end

  private

  def check_release_status(release_date)
    already_released = Time.now.after? release_date

    return 0 if already_released
    1
  end
end
