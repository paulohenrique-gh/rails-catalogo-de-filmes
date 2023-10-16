class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(
      name: params[:director][:name],
      nationality: params[:director][:nationality],
      birth_date: params[:director][:birth_date],
      genre_id: params[:director][:genre_id]
    )

    if @director.save
      flash[:notice] = 'Novo diretor cadastrado com sucesso!'
      return redirect_to director_path(@director.id)
    end

    render :new
  end

  def show
    @director = Director.find(params[:id])
    @movies = Movie.where(director: @director)
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(
      name: params[:director][:name],
      nationality: params[:director][:nationality],
      birth_date: params[:director][:birth_date],
      genre_id: params[:director][:genre_id]
    )
      flash[:notice] = "Dados atualizados!"
      return redirect_to director_path(@director.id)
    end

    render :edit
  end

  def destroy
    director = Director.find(params[:id])
    director.destroy

    flash[:notice] = 'Diretor excluído com sucesso!'
    redirect_to directors_path
  end
end
