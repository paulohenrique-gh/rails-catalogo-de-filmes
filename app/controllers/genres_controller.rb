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

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    puts "Params no update #{params}"
    @genre = Genre.find(params[:id])
    old_name = @genre.name

    if @genre.update(name: params[:genre][:name])
      flash[:notice] = "Gênero #{old_name} alterado para #{@genre.name}"
      return redirect_to genres_path
    end
  end
end
