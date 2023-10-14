class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])

    if @genre.save
      flash[:notice] = 'Novo gênero cadastrado com sucesso!'
      return redirect_to genres_path
    end

    render :new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(name: params[:genre][:name])
      flash[:notice] = "Dados atualizados!"
      return redirect_to genre_path(@genre.id)
    end

    render :edit
  end
end
